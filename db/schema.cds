namespace spacefarer.cap.db;

using {
    User,
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';


entity Spacefarer {
    key ID                         : UUID;
        email                      : String(50);
        first_name                 : String(30);
        last_name                  : String(30);
        space_ship                 : Association to SpaceShip;
        stardust_collection_status : Association to Status;
        wormhole_navigation_skill  : Association to Skill;
        origin_planet              : String(50);
        spacesuit_color            : String(50);
        sign_up_date               : Date;
        adventure                  : Composition of many {
                                         key ID        : UUID;
                                             timestamp : type of managed : createdAt;
                                             message   : String;
                                     };

}

entity SpaceShip : cuid, managed {
    name        : String(50);
    length      : Integer;
    material    : String(50);
    spacefarers : Association to many Spacefarer
                      on spacefarers.space_ship = $self;
}

entity Status : CodeList {
    key code                    : String enum {
            high   = 'H';
            medium = 'M';
            low    = 'L';
        };
        criticality             : Integer;
        insertDeleteRestriction : Boolean;
}

entity Skill : CodeList {
    key code        : String enum {
            bad     = 'B';
            good    = 'G';
            awesome = 'A';
        };
        criticality : Integer;
}
