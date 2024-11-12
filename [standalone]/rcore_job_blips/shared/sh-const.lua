NONE_RESOURCE = 'none'
AUTO_DETECT = 'auto_detect'

Framework = {
    ESX = 'es_extended',
    QBCore = 'qb-core',
    Standalone = NONE_RESOURCE,
    AUTO_DETECT = AUTO_DETECT
}

Inventory = {
    OX = 'ox_inventory',
    ESX = 'es_extended',
    QB = 'qb-inventory',
    QS = 'qs-inventory',
    MF = 'mf-inventory',
    CHEZZA = 'inventory',
    PS = 'ps-inventory',
    LJ = 'lj-inventory',
    TGIANN = 'tgiann-inventory',
    AUTO_DETECT = AUTO_DETECT
}

Duty = {
    QBCore = 'qb-core',
    NONE = NONE_RESOURCE,
    AUTO_DETECT = AUTO_DETECT
}

VehicleClasses = {
    AUTOMOBILE = 'automobile',
    BIKE = 'bike',
    BOAT = 'boat',
    HELI = 'heli',
    PLANE = 'plane',
    SUBMARINE = 'submarine',
    TRAILER = 'trailer',
    TRAIN = 'train',
}

PREFIX_SUFFIX_KVP_KEY = 'rcore_job_blips:prefix_suffix:%s'
PLAYER_STATE_IDENTIFIER_KEY = 'rcore_job_blips:identifier'
POSITIONS_GLOBAL_STATE_KEY = 'rcore_job_blips:positions'
VEHICLES_GLOBAL_STATE_KEY = 'rcore_job_blips:vehicles'
BLIP_ID_FORMAT = '%s_%s'
