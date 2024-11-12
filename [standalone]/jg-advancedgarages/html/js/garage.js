async function garageTakeOut(plate, jobGarage, gangGarage, garageId) {
  await fetch(`https://jg-advancedgarages/${jobGarage ? "jobGarageTakeOutVehicle" : gangGarage ? "gangGarageTakeOutVehicle" : "garageTakeOutVehicle"}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({ plate, garageId }),
  });

  garageModal.hide();
}

function toggleShowTransfer(index) {
  const popup = document.querySelector(`#transfer-popup-${index}`);
  popup.style.display = popup.style.display === "none" ? "block" : "none";
}

function onTransferTypeChange(type, index, transferCost) {
  document.querySelector(`#garage-transfer-garage-id-${index}`).style.display = type === "garage" ? "block" : "none";
  document.querySelector(`#garage-transfer-player-id-${index}`).style.display = type === "player" ? "block" : "none";
  document.querySelector(`#garage-transfer-submit-${index}`).innerHTML = type === "garage" ? `Transfer ${transferCost !== "FREE" ? `<span class="badge bg-white text-success ms-1">${transferCost}</span>` : ""}` : "Transfer";
}

async function onTransferSubmit(e, plate, curGarageId) {
  e.preventDefault();

  const type = e.target[0].value;
  const garageId = e.target[1].value;
  const playerId = parseInt(e.target[2].value);

  await fetch(`https://jg-advancedgarages/garageTransferVehicle`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({
      plate,
      type,
      playerId,
      garageId,
      curGarageId
    }),
  });
}

function showGarage(data) {
  let { vehicles = [], jobGarage = false, gangGarage = false, garageId, garageType, enableTransfers = {}, transferCost, returnCost, allGarages = [], allPlayers = [] } = data;
  
  let accordionContent = "";
  if (!vehicles.length) accordionContent = "There are no vehicles in this garage.";

  for (let [i, veh] of vehicles.reduce((acc, v) => (v.garage_id === garageId && !v.impound) ? [v, ...acc] : [...acc, v], []).entries()) {
    const { plate, fuel, engine, body, garage_id: vehGarageId, in_garage, impound, impound_retrievable, impound_data, vehicleLabel } = veh;
    const impoundMetadata = JSON.parse(impound_data || "{}");

    accordionContent += `
      <div class="accordion-item">
        <h2 class="accordion-header" id="heading-${i}">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#garage-collapse-${i}" aria-expanded="true" aria-controls="garage-collapse-${i}">
            <div class="d-flex flex-fill justify-content-between">
              <div>
                <span>${vehicleLabel}</span>
                <div class="badge bg-dark text-warning ms-2" style="font-family:monospace">${plate}</div>
              </div>
              <div class="me-3">
                ${(jobGarage || gangGarage) && !impound ? "" : impound ? `
                  <div class="badge bg-danger">Impound</div>
                ` : `
                  <div class="badge ${vehGarageId === garageId ? "bg-info" : "bg-dark"}">${vehGarageId}</div>
                `}
              </div>
            </div>
          </button>
        </h2>

        <div id="garage-collapse-${i}" class="accordion-collapse collapse" aria-labelledby="heading-${i}" data-bs-parent="#garage-vehicles-list">
          <div class="accordion-body">
            <div class="mb-4">
              <div class="d-flex align-items-center">
                <div class="w-25 text-muted">Fuel</div>
                <div class="progress flex-fill">
                  <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: ${(parseInt(fuel) / 100) * 100}%;">${parseInt((parseInt(fuel) / 100) * 100)}%</div>
                </div>
              </div>
              <div class="d-flex align-items-center">
                <div class="w-25 text-muted">Engine</div>
                <div class="progress flex-fill">
                  <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: ${(parseInt(engine) / 1000) * 100}%;">${parseInt((parseInt(engine) / 1000) * 100)}%</div>
                </div>
              </div>
              <div class="d-flex align-items-center">
                <div class="w-25 text-muted">Body</div>
                <div class="progress flex-fill">
                  <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" style="width: ${(parseInt(body) / 1000) * 100}%;">${parseInt((parseInt(body) / 1000) * 100)}%</div>
                </div>
              </div>
            </div>

            ${impound ? `
              <div class="card border-danger">
                <div class="card-header">Impound Information</div>
                <div class="card-body">
                  <p><span class="text-muted">Impounded by:</span> ${impoundMetadata.charname}</p>
                  <p><span class="text-muted">Reason:</span> ${impoundMetadata.reason || "No reason provided"}</p>
                  ${impound_retrievable ? `
                    <p class="text-success">You can collect your vehicle from the impound.</p>
                  ` : `
                    <p class="text-danger">Please contact ${impoundMetadata.charname} in order to collect your vehicle.</p>
                  `}
                </div>
              </div>
            ` : `
              <div class="d-flex justify-content-between">
                ${vehGarageId === garageId || (jobGarage || gangGarage) ? 
                  `<button class="btn btn-success" onclick="garageTakeOut('${plate}', ${!!jobGarage}, ${!!gangGarage}, '${garageId.replace(/'/g, "\\'")}')">
                    ${in_garage ? "Take Out" : `Return & Take Out ${returnCost !== "FREE" ? `<span class="badge bg-white text-success ms-1">${returnCost}</span>` : ""}`}
                  </button>` : `<button class="btn btn-success" disabled>In Garage ${vehGarageId}</button>`
                }
                ${(enableTransfers.betweenGarages || enableTransfers.betweenPlayers) ? `
                  <button class="btn btn-secondary" onclick="toggleShowTransfer(${i})">
                    ${enableTransfers.betweenGarages && enableTransfers.betweenPlayers ? `Transfer to a Garage or Player` : enableTransfers.betweenGarages ? `Transfer to a Garage` : `Transfer to a Player`}
                  </button>
                ` : ""}
              </div>
              
              ${(enableTransfers.betweenGarages || enableTransfers.betweenPlayers) ?  `
                <form onsubmit="onTransferSubmit(event, '${plate}', '${garageId.replace(/'/g, "\\'")}')" class="card border-light mt-4" id="transfer-popup-${i}" style="display:none">
                  <div class="card-header">Transfer</div>
                  <div class="card-body d-flex">
                    <select class="form-select w-25 me-1" onchange="onTransferTypeChange(event.target.value, ${i}, '${transferCost}')">
                      ${enableTransfers.betweenGarages ? `<option value="garage">Garage</option>` : ""}
                      ${enableTransfers.betweenPlayers ? `<option value="player">Player</option>` : ""}
                    </select>
                    <div class="flex-fill">
                      ${enableTransfers.betweenGarages ? `
                        <select class="form-select" id="garage-transfer-garage-id-${i}">
                          ${allGarages.filter((g) => vehGarageId !== g).map((g) => `
                            <option value="${g}" ${garageId === g ? "selected" : ""}>
                              ${g} ${garageId === g ? "(Current garage)" : ""}
                            </option>
                          `)}
                        </select>
                      ` : ""}
                      ${enableTransfers.betweenPlayers ? `
                        <select class="form-select" id="garage-transfer-player-id-${i}" ${enableTransfers.betweenGarages ? `style="display:none"` : ""}>
                          ${!allPlayers.length ? '<option disabled>No players online</option>' : allPlayers.map(({id, name}) => `<option value="${id}">${name} (#${id})</option>`)}
                        </select>
                      ` : ""}
                    </div>
                    <button class="btn btn-success ms-1" id="garage-transfer-submit-${i}">
                      Transfer ${returnCost !== "FREE" ? `<span class="badge bg-white text-success ms-1">${returnCost}</span>` : ""}
                    </button>
                  </div>
                </form>
              ` : ""}
            `}
          </div>
        </div>
      </div>
    `;
  }

  document.querySelector("#garage-name").innerHTML = `${garageType ? `<div class="badge bg-dark text-muted me-1">${garageType.toUpperCase()}</div>` : ""}${garageId || "Garage"}`;
  document.querySelector("#garage-vehicles-list").innerHTML = accordionContent;
  document.querySelector("#garage-vehicles-count").innerHTML = vehicles.length;

  garageModal.show();
}

