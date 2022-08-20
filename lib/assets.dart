const library =
    '''enemy_1|16,16;10,0;1,1;14,0;1,1;14,0;1,1;8,0;14,1;2,0;1,1;12,0;1,1;2,0;1,1;2,0;1,1;6,0;1,1;2,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;3,0;6,1;3,0;1,1;2,0;1,1;2,0;1,1;6,0;1,1;2,0;1,1;2,0;1,1;12,0;1,1;2,0;14,1;6,0;1,1;4,0;1,1;10,0;1,1;4,0;1,1;10,0;1,1;4,0;1,1;8,0;3,1;4,0;3,1;3,0
character_4|16,16;22,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;10,0;8,1;8,0;1,1;6,0;1,1;8,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;6,0;1,1;1,0;1,1;6,0;1,1;1,0;1,1;5,0;2,1;6,0;2,1;7,0;1,1;3,0;1,1;2,0;1,1;8,0;1,1;6,0;1,1;8,0;2,1;4,0;2,1;8,0;8,1;10,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;22,0
character_1|16,16;22,0;1,1;1,0;1,1;13,0;1,1;1,0;1,1;13,0;1,1;1,0;1,1;11,0;7,1;9,0;1,1;5,0;1,1;7,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;1,0;1,1;6,0;2,1;5,0;2,1;8,0;1,1;2,0;1,1;2,0;1,1;9,0;1,1;5,0;1,1;9,0;7,1;11,0;1,1;1,0;1,1;71,0
character_2|16,16;22,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;10,0;8,1;8,0;1,1;6,0;1,1;5,0;1,1;2,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;3,0;1,1;1,0;1,1;6,0;1,1;1,0;1,1;5,0;2,1;6,0;2,1;7,0;1,1;3,0;1,1;2,0;1,1;8,0;1,1;6,0;1,1;8,0;1,1;6,0;1,1;8,0;8,1;10,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;22,0
character_3|16,16;5,0;1,1;4,0;1,1;9,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;7,0;1,1;3,0;2,1;3,0;1,1;5,0;1,1;10,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;2,0;1,1;1,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;1,0;1,1;1,0;2,1;10,0;2,1;3,0;1,1;10,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;4,0;2,1;4,0;1,1;4,0;2,1;8,0;2,1;5,0;10,1;9,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;6,0''';

const characterAnimation =
    '''character_4_1|16,16;5,0;1,1;4,0;1,1;9,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;7,0;1,1;3,0;2,1;3,0;1,1;5,0;1,1;10,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;2,0;1,1;1,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;1,0;1,1;1,0;2,1;10,0;2,1;3,0;1,1;10,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;4,0;2,1;4,0;1,1;4,0;2,1;8,0;2,1;5,0;10,1;9,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;6,0
character_4_2|16,16;5,0;1,1;4,0;1,1;9,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;7,0;1,1;3,0;2,1;3,0;1,1;5,0;1,1;10,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;2,0;3,1;10,0;3,1;2,0;1,1;10,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;4,0;2,1;4,0;1,1;4,0;2,1;8,0;2,1;5,0;10,1;9,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;6,0
character_4_3|16,16;5,0;1,1;4,0;1,1;9,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;7,0;1,1;3,0;2,1;3,0;1,1;5,0;1,1;10,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;3,0;2,1;10,0;2,1;1,0;1,1;1,0;1,1;10,0;1,1;1,0;1,1;2,0;1,1;3,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;4,0;2,1;4,0;1,1;4,0;2,1;8,0;2,1;5,0;10,1;9,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;6,0
character_4_4|16,16;5,0;1,1;4,0;1,1;9,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;8,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;7,0;1,1;3,0;2,1;3,0;1,1;5,0;1,1;10,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;2,0;1,1;2,0;3,1;10,0;3,1;2,0;1,1;10,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;4,0;2,1;4,0;1,1;4,0;2,1;8,0;2,1;5,0;10,1;9,0;1,1;2,0;1,1;12,0;1,1;2,0;1,1;6,0''';

const map =
    '''[{"x":2,"y":3,"data":{"sprite":"character_3"}},{"x":11,"y":3,"data":{"sprite":"enemy_1"}}]''';

const animationMap = '''[{"x":4,"y":3,"data":{"sprite":"character_4_1"}}]''';
