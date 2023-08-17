resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

Discription "Qua Car Menu"

client_scripts {
    'client/client.lua',
    'es_extended/client/main.lua'
    -- Eklemek İsterseniz Diğer Client Dosyaları
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- MySQL-Async'ı yüklemek için
    '@es_extended/locale.lua',
    -- Eklemek İsterseniz Diğer Server Dosyaları
}
