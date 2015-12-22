function new_coord_log = update_coord(coord_log, position)

switch position
    case 'A1'
        coord_log(3,1) = 1;
        new_coord_log = coord_log;
    case 'A2'
        coord_log(2,1) = 1;
        new_coord_log = coord_log;
    case 'A3'
        coord_log(1,1) = 1;
        new_coord_log = coord_log;
    case 'B1'
        coord_log(3,2) = 1;
        new_coord_log = coord_log;
    case 'B2'
        coord_log(2,2) = 1;
        new_coord_log = coord_log;
    case 'B3'
        coord_log(1,2) = 1;
        new_coord_log = coord_log;
    case 'C1'
        coord_log(3,3) = 1;
        new_coord_log = coord_log;
    case 'C2'
        coord_log(2,3) = 1;
        new_coord_log = coord_log;
    case 'C3'
        coord_log(1,3) = 1;
        new_coord_log = coord_log;
end
