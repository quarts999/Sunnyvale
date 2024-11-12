var CurrentPseudo
var configMaxRound = 10
var configMaxPlayerPerTeam = 10

var currentMapSelected
var configModeAvailable
var currentShop
var CurrentConfig
var allMaps

window.addEventListener("message", function(event) {
	console.log("Allo c'est l'ui js !!! ")
    var v = event.data    
    switch (v.action) {
        case 'Accueil': 
			console.log("Accueil")
			// document.body.style.display = event.data.enable ? "block" : "none";
			// currentShop = event.data.shop
			CurrentConfig = null
			 // CurrentConfig = Object.values(JSON.parse(v.config))
			 configMaxRound = v.maxlap
			 // configMaxPlayerPerTeam = v.maxplayer
			 allMaps = Object.values(JSON.parse(v.map))
			 currentShop = v.shop
			 
			
			
			 OpenAcceuil()
        break;

        case 'lstGame': 
            var checkValue 
            // $('.ListContainer').fadeIn(500)
			// console.log("----------lstGame----------")
			OpenList()
            // $('tbody').append(`
                // <tr class="eachListGame" id="${v.GameID}">
                    // <td class="GameName">${v.GameName}</td>
                    // <td class="GameOwner">${v.GameOwner}</td>
					// <td class="NbPlayer">${v.NbPlayer}</td>
                    // <td class="GameMap">${v.GameMap}</td>
                    // <td class="GameRound">${v.round}</td>
                    // <td class="GameStatus">${v.status}</td>
                // </tr>
            // `)
			
			
			
			 $('tbody').append(`
                 <tr class="eachListGame" id="${v.GameID}">
                    <td class="LobbyName">${v.LobbyName}</td>
					<td class="GameMode">${v.GameMode}</td>
                    <td class="GameMap">${v.GameMap}</td>
                    <td class="Power">${v.kartpower}</td>
                    <td class="NbPlayer">${v.NbPlayer}</td>
                    <td class="GameRound">${v.GameRound}</td>
                    <td class="GameStatus">${v.GameStatus}</td>
                </tr>
            `)

            $(`#${v.GameID}`).click(function(){
				// console.log("ERTYUIOP"+v.GameID)
                $.post('https://PlasmaKart/RequestGameDetails', JSON.stringify({
                    reportid : this.id
                }));
                
            })
        break;

        case 'OpenGame': 
			OpenDetails()
			players = v.data.players
			playersB = v.data.EquipB
			// console.log("isowner : "+v.isowner)
			// document.getElementById("
			$('#HiddenDataID').val(v.data.idx)
			$('#JoinLobbyName').val(v.data.sessionname)
			$('#JoinGameMode').val(v.data.modes + " " + v.data.kartpower+"cc")
			$('#JoinMapName').val(v.data.maps)
			$('#JoinNbRound').val(v.data.nblap)
			
			
			// console.log("whoami: "+v.whoami+" v.data.ownerName: "+v.data.ownerName)
			if (v.isowner === true) {
			// CloseAll()
			$('.ValidateStartGame').show()
			}
			// $('#JoinBox').val(v.data.maps)
			for (let i = 0; allMaps[i] && i < 500; i++) {

				if (allMaps[i].Name == v.data.maps) {
					img = "./img/"+allMaps[i].img
					document.getElementById("JoinBoxID").style.backgroundImage = "url('"+img+"')"
				}
			}
			
			// img = "./img/"+v.data.maps+".jpg"
			// document.getElementById("JoinBoxID").style.backgroundImage = "url('"+img+"')"
			
			CurText = $('#JoinPlayerList').val()
			// CurText = "Team Red : "+ '\r'
			console.log("aaaaaaaaaaaaaaaaaaa")
			$('#JoinPlayerList').val(CurText)
			for (let i = 0; players[i] && i < 500; i++) {
				console.log("a:"+players[i].playername)
				CurText = $('#JoinPlayerList').val()
				CurText = CurText + players[i].playername + '\r'
				$('#JoinPlayerList').val(CurText)
				
			}
			
			// players.forEach(function (a, b) {
				// console.log("a:"+a.playername+" b:"+b)
				// CurText = $('#JoinPlayerList').val()
				// CurText = CurText + a.playername + '\r'
				// $('#JoinPlayerList').val(CurText)
			// });
			
			
			
			
        break;
		
		case 'quit':
			CloseAll()
		break;

    }
});

$(document).keyup((e) => {
    if (e.key === "Escape") {
        CloseAll()
    }
});


$(function(){
	
    $('.closeMenu').click(function(){
        CloseAll()
        $('.titre').text('PLASMAKART')
    })
	
	$('.closeMenuList').click(function(){
        CloseAll()
		$('.titre').text('PLASMAKART')
    })
	
    $('.CreateGame').click(function(){
        OpenCreateGame()
        $('.titre').text('Create Game')
		// console.log("pseudo "+CurrentPseudo)
		// $('.InputCreatePseudo').val(CurrentPseudo)
    })
	
    $('.JoinGame').click(function(){
		CloseAll()
		$('.titre').text('PLASMAKART')
		$.post('https://PlasmaKart/OpenJoinGame', JSON.stringify({curshop: currentShop}));
    })
	
	// $('.JoinBlue').click(function(){
		// var game = $('#HiddenDataID').val()
	
		// $.post('https://PlasmaKart/JoinAGame', JSON.stringify({
			// Game : game,
			// side : "blue"
		// }));
		
		// CloseAll()
    // })
	
	$('.JoinRed').click(function(){
		var game = $('#HiddenDataID').val()
	
		$.post('https://PlasmaKart/JoinAGame', JSON.stringify({
			Game : game,
			side : "red"
		}));
		
		CloseAll()
    })
	
    $('.ValidateCreateGame').click(function(){
		// pseudo = $('.InputCreatePseudo').val()
		maps = $('.InputCreateMap').val()
		nblap = $('.InputCreateRound').val()
		kartPower = $('.InputCreateNbPlayer').val()
		mode = $('.InputCreateGameMode').val()
        $.post('https://PlasmaKart/SendData', JSON.stringify({
			// pseudo : pseudo,
			nblap : nblap,
			maps : maps,
			mode: mode,
			kartPower: kartPower,
			curshop: currentShop
        }));
        CloseAll()
    })
})

function changeListMap(map){
	// console.log("Et la map elle a changé ! "+a.value)
	
	// document.body
	
	// $('.CreateIMGMapBox').backgroundImage = "url('"+img+"')"
	
	
	
	// $('.GameModeItemSelect').remove()
	for (let i = 0; allMaps[i] && i < 500; i++) {
		console.log("allMaps name : "+allMaps[i].Name+" qte: "+allMaps[i].qte+" price: "+allMaps[i].price)
		console.log("allMaps name : "+allMaps[i])
		if (allMaps[i].Name == map.value) {
			img = "./img/"+allMaps[i].img
			document.getElementById("CreateIMGMapBoxID").style.backgroundImage = "url('"+img+"')"
		}
		
		
		// cashRegCurrentIndex = 0
		// compteurItem += 1
	}
	//CurrentConfig.forEach(function (a, b) {
	//	var temp2 = Object.values(a)
	//	// console.log("gf   "+temp2[1]+"          er    "+temp2[0])
	//	if (temp2[1] === map.value || temp2[0] === map.value) {
	//		
	//		// console.log("map trouvé")
	//		if (Array.isArray(temp2[1])===true) {
	//			temp2[1].forEach(function (a2, b2) {
	//				var temp
	//				temp = document.createElement('option');
	//				temp.value = a2
	//				temp.innerHTML = a2
	//				temp.classList.add('GameModeItemSelect')
	//				$('.InputCreateGameMode').append(temp)
	//			});
	//		} else {
	//			temp2[0].forEach(function (a2, b2) {
	//				var temp
	//				temp = document.createElement('option');
	//				temp.value = a2
	//				temp.innerHTML = a2
	//				temp.classList.add('GameModeItemSelect')
	//				$('.InputCreateGameMode').append(temp)
	//			});
	//		}
	//	}
	//});
	
	
	
	// style.backgroundImage = "url('"img"')"
}

// $('.InputCreateMap').addEventListener('change', function() {
  // console.log('You selected: ', this.value);
// });

function CloseAll(){
    $.post('https://PlasmaKart/exit', JSON.stringify({}));
	
	$('.ListContainer').fadeOut(500)
    $('.PageAcceuil').hide()
    $('.CreateGamePage').hide()
    $('.GameDetails').hide()
	$('.MenuContainer').fadeOut(500)

    $('.eachListGame').remove()
    $(':input').val('')
	$('.ValidateStartGame').hide()
}

function OpenCreateGame(){
	$('.ListContainer').fadeOut(500)
    $('.PageAcceuil').hide()
    $('.CreateGamePage').show()
    $('.GameDetails').hide()
	$('.MenuContainer').fadeIn(500)
	$('.ValidateStartGame').hide()
	
	$('.RoundItemSelect').remove()
	for (i = 1; i < configMaxRound+1; i++) {
		// $('.InputCreateRound').append(temp)
		var temp
		temp = document.createElement('option');
		temp.value = i
		temp.innerHTML = i
		temp.classList.add('RoundItemSelect')
		$('.InputCreateRound').append(temp)


    }
	
	//$('.MaxPlyItemSelect').remove()
	//for (i = 1; i < configMaxPlayerPerTeam+1; i++) {
	//	// $('.InputCreateRound').append(temp)
	//	var temp
	//	temp = document.createElement('option');
	//	temp.value = i
	//	temp.innerHTML = i
	//	temp.classList.add('MaxPlyItemSelect')
	//	$('.InputCreateNbPlayer').append(temp)
    //}
	// allMaps.forEach(function (a, b) {
		// console.log("a:"+a[1])
	// });
	$('.MapItemSelect').remove()
	for (let i = 0; allMaps[i] && i < 500; i++) {
		console.log("allMaps name : "+allMaps[i].Name+" Available: "+allMaps[i].Available+" price: "+allMaps[i].price)
		console.log("allMaps name : "+allMaps[i])
		if (allMaps[i].Available == true) {
		var temp
		temp = document.createElement('option');
		temp.value = allMaps[i].Name
		temp.innerHTML = allMaps[i].Name
		temp.classList.add('MapItemSelect')
		$('.InputCreateMap').append(temp)
		}
		
		// cashRegCurrentIndex = 0
		// compteurItem += 1
	}
	//allMaps.forEach(function (a, b) {
	//	console.log("a:"+Object.values(a)[1][0])
	//		// console.log("a:"+a+" b:"+b)
	//	//var temp2 = Object.values(a)
	//	//temp2.forEach(function (a1, b1) {
	//	//	// console.log("  a1:"+a1+" b1:"+b1+" array? : "+Array.isArray(a1))
	//	//	if (Array.isArray(a1)===true) {
	//	//		
	//	//	} else {
	//	//		var temp
	//	//		temp = document.createElement('option');
	//	//		temp.value = a1
	//	//		temp.innerHTML = a1
	//	//		temp.classList.add('MapItemSelect')
	//	//		$('.InputCreateMap').append(temp)
	//	//	}
	//	//
	//	//});
	//});
	
	
}

function OpenAcceuil(){
	$('.ListContainer').fadeOut(500)
    $('.PageAcceuil').show()
    $('.CreateGamePage').hide()
    $('.GameDetails').hide()
	$('.MenuContainer').fadeIn(500)
	$('.ValidateStartGame').hide()
}

function OpenDetails(){
	$('.ListContainer').fadeOut(500)
    $('.PageAcceuil').hide()
    $('.CreateGamePage').hide()
    $('.GameDetails').show()
	$('.MenuContainer').fadeIn(500)
	$('.ValidateStartGame').hide()
}

function OpenList() {
	$('.MenuContainer').fadeOut(500)
	$('.ListContainer').fadeIn(500)
	$('.ValidateStartGame').hide()
}


function JoinGame() {
	
	var game = $('#HiddenDataID').val()
	
	
	$.post('https://PlasmaKart/JoinAGame', JSON.stringify({
		Game : game
		
	}));
	
	CloseAll()
	// console.log("CLICK !!!" + $('#JoinGameName').val())
}

function StartGame() {
	var game = $('#HiddenDataID').val()
	
	
	$.post('https://PlasmaKart/StartAGame', JSON.stringify({
		Game : game,
		currentShop : currentShop
	}));
	
	CloseAll()
	
	
}

function SpectateGame() {
	var game = $('#HiddenDataID').val()
	
	
	$.post('https://PlasmaKart/SpectateAGame', JSON.stringify({
		Game : game
		
	}));
	
	CloseAll()
	
	
}

function ExitLobby() {
	var game = $('#HiddenDataID').val()
	
	
	$.post('https://PlasmaKart/ExitLobby', JSON.stringify({
		Game : game
		
	}));
	
	CloseAll()
	
	
}

function BackFromList() {

	$.post('https://PlasmaKart/OpenJoinGame', JSON.stringify({curshop: currentShop}));
	
	CloseAll()
	
	
}

