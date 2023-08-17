ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand('menugoster', function(source, args, rawCommand)
    if ESX ~= nil then
        local elements = {}

        table.insert(elements, {label = 'Aracı Koduyla Çağır', value = 'codeCar'})
        table.insert(elements, {label = 'Araç Sil', value = 'delCar'})
        table.insert(elements, {label = 'Aracı Tamir Et', value = 'repairCar'})
        table.insert(elements, {label = 'Menüyü Kapat', value = 'closeMenu'})

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu', {
            title    = 'Quartzz Araç Menüsü',
            align    = 'top-left',
            elements = elements
        }, function(data, menu)
            if data.current.value == 'codeCar' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dialog', {
                    title = 'Araç Koduyla Çağır',
                }, function(data2, menu2)
                    local codeValue = data2.value
                    TriggerEvent("QuaLoading:StartLoading",2,"Araç Çağırılıyor")
                    ExecuteCommand("car "..codeValue)
                    menu2.close()
                end, function(data2, menu2)
                    menu2.close()
                end)
            elseif data.current.value == 'delCar' then
                TriggerEvent("QuaLoading:StartLoading",1,"Araç Siliniyor")
                ExecuteCommand("dv")
            elseif data.current.value == 'repairCar' then
                local vehicle = ESX.Game.GetVehicleInDirection()
                if DoesEntityExist(vehicle) then
                    SetVehicleFixed(vehicle)
                    SetVehicleDeformationFixed(vehicle)
                    SetVehicleUndriveable(vehicle, false)
                    SetVehicleEngineOn(vehicle, true, true)
                    TriggerEvent("QuaLoading:StartLoading",1,"Araç Tamir Ediliyor")
                else
                    ESX.ShowNotification("Yakınında araç bulunamadı!")
                end
            elseif data.current.value == 'closeMenu' then
                menu.close()
            end
        end, function(data, menu)
            menu.close()
        end)
    else
        print("ESX nesnesi yüklenmedi.")
    end
end, false)
