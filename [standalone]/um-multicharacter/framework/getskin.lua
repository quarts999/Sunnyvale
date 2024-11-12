local selectedClothingMenu = Config.Clothing

lib.callback.register("um-multicharacter:server:getSkin", function(_, cid)
    if selectedClothingMenu == 'bl_appearance' then
        local appearance = exports.bl_appearance:GetPlayerAppearance(cid)

        if not appearance then
            return nil, nil
        end

        return appearance.model, appearance
    end

    local skinQuery = MySQL.single.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ? LIMIT 1',
        { cid, 1 })

    if skinQuery ~= nil then
        local skin = json.decode(skinQuery.skin)
        return skinQuery.model or skin.model or nil, skin
    end

    return nil, nil
end)
