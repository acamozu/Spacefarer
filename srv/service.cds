using spacefarer.cap.db as my from '../db/schema';

service SpacefarerService {


    //@readonly
    entity ReadSpacefarer   as projection on my.Spacefarer;

    @updateonly
    entity UpdateSpacefarer as projection on my.Spacefarer;

    @insertonly
    entity InsertSpacefarer as projection on my.Spacefarer;

    @deleteonly
    entity DeleteSpacefarer as projection on my.Spacefarer;
}

annotate SpacefarerService.ReadSpacefarer with @odata.draft.enabled;


//annotate SpacefarerService with @(requires: 'support');
