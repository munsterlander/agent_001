class MiniLevel {
  static const level1 =
      '''[{"x":0,"y":9,"data":{"sprite":"block_bottom_left"}},{"x":14,"y":9,"data":{"sprite":"block_bottom_right"}},{"x":14,"y":0,"data":{"sprite":"block_top_right"}},{"x":0,"y":0,"data":{"sprite":"block_top_left"}},{"x":1,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":1,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":0,"y":1,"data":{"sprite":"block_left_right"}},{"x":0,"y":2,"data":{"sprite":"block_left_right"}},{"x":0,"y":3,"data":{"sprite":"block_left_right"}},{"x":0,"y":4,"data":{"sprite":"block_left_right"}},{"x":0,"y":5,"data":{"sprite":"block_left_right"}},{"x":0,"y":6,"data":{"sprite":"block_left_right"}},{"x":0,"y":7,"data":{"sprite":"block_left_right"}},{"x":0,"y":8,"data":{"sprite":"block_left_right"}},{"x":14,"y":6,"data":{"sprite":"door","nextLevel":"1"}},{"x":14,"y":8,"data":{"sprite":"block_left_right"}},{"x":14,"y":7,"data":{"sprite":"block_end_top"}},{"x":14,"y":5,"data":{"sprite":"block_end_bottom"}},{"x":14,"y":4,"data":{"sprite":"block_left_right"}},{"x":14,"y":3,"data":{"sprite":"block_left_right"}},{"x":14,"y":2,"data":{"sprite":"block_left_right"}},{"x":14,"y":1,"data":{"sprite":"block_left_right"}},{"x":5,"y":9,"data":{"sprite":"block_bottom"}},{"x":5,"y":0,"data":{"sprite":"block_top"}},{"x":5,"y":3,"data":{"sprite":"block_end_bottom"}},{"x":5,"y":2,"data":{"sprite":"block_left_right"}},{"x":5,"y":1,"data":{"sprite":"block_left_right"}},{"x":5,"y":6,"data":{"sprite":"block_end_top"}},{"x":5,"y":7,"data":{"sprite":"block_left_right"}},{"x":5,"y":8,"data":{"sprite":"block_left_right"}},{"x":2,"y":1,"data":{"sprite":"player_stand"}}]''';

  static const level2 =
      '''[{"x":23,"y":0,"data":{"sprite":"block_top_right"}},{"x":23,"y":15,"data":{"sprite":"block_bottom_right"}},{"x":0,"y":15,"data":{"sprite":"block_bottom_left"}},{"x":0,"y":0,"data":{"sprite":"block_top_left"}},{"x":2,"y":14,"data":{"sprite":"player_stand"}},{"x":1,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":14,"data":{"sprite":"block_left_right"}},{"x":4,"y":13,"data":{"sprite":"block_left_right"}},{"x":4,"y":12,"data":{"sprite":"block_left_right"}},{"x":4,"y":11,"data":{"sprite":"block_left_right"}},{"x":4,"y":10,"data":{"sprite":"block_left_right"}},{"x":4,"y":9,"data":{"sprite":"block_left_right"}},{"x":4,"y":8,"data":{"sprite":"block_left_right"}},{"x":4,"y":7,"data":{"sprite":"block_left_right"}},{"x":4,"y":6,"data":{"sprite":"block_left_right"}},{"x":4,"y":5,"data":{"sprite":"block_left_right"}},{"x":0,"y":14,"data":{"sprite":"block_left_right"}},{"x":0,"y":13,"data":{"sprite":"block_left_right"}},{"x":0,"y":12,"data":{"sprite":"block_left_right"}},{"x":0,"y":11,"data":{"sprite":"block_left_right"}},{"x":0,"y":10,"data":{"sprite":"block_left_right"}},{"x":0,"y":8,"data":{"sprite":"block_left_right"}},{"x":0,"y":9,"data":{"sprite":"block_left_right"}},{"x":0,"y":7,"data":{"sprite":"block_left_right"}},{"x":0,"y":6,"data":{"sprite":"block_left_right"}},{"x":0,"y":5,"data":{"sprite":"block_left_right"}},{"x":0,"y":4,"data":{"sprite":"block_left_right"}},{"x":0,"y":3,"data":{"sprite":"block_left_right"}},{"x":0,"y":2,"data":{"sprite":"block_left_right"}},{"x":0,"y":1,"data":{"sprite":"block_left_right"}},{"x":1,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":4,"data":{"sprite":"block_end_top"}},{"x":4,"y":15,"data":{"sprite":"block_bottom"}},{"x":8,"y":0,"data":{"sprite":"block_top"}},{"x":8,"y":1,"data":{"sprite":"block_left_right"}},{"x":8,"y":2,"data":{"sprite":"block_left_right"}},{"x":8,"y":3,"data":{"sprite":"block_left_right"}},{"x":8,"y":4,"data":{"sprite":"block_left_right"}},{"x":8,"y":5,"data":{"sprite":"block_left_right"}},{"x":8,"y":6,"data":{"sprite":"block_left_right"}},{"x":8,"y":7,"data":{"sprite":"block_left_right"}},{"x":8,"y":8,"data":{"sprite":"block_left_right"}},{"x":8,"y":13,"data":{"sprite":"block_end_top"}},{"x":8,"y":14,"data":{"sprite":"block_left_right"}},{"x":8,"y":9,"data":{"sprite":"block_end_bottom"}},{"x":5,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":15,"data":{"sprite":"block_bottom"}},{"x":9,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":14,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":14,"data":{"sprite":"block_left_right"}},{"x":23,"y":13,"data":{"sprite":"block_left_right"}},{"x":23,"y":12,"data":{"sprite":"block_left_right"}},{"x":23,"y":11,"data":{"sprite":"block_left_right"}},{"x":23,"y":10,"data":{"sprite":"block_left_right"}},{"x":23,"y":9,"data":{"sprite":"block_left_right"}},{"x":23,"y":8,"data":{"sprite":"block_left_right"}},{"x":23,"y":7,"data":{"sprite":"block_left_right"}},{"x":23,"y":6,"data":{"sprite":"block_left_right"}},{"x":23,"y":5,"data":{"sprite":"block_left_right"}},{"x":23,"y":4,"data":{"sprite":"block_left_right"}},{"x":23,"y":3,"data":{"sprite":"block_left_right"}},{"x":23,"y":2,"data":{"sprite":"block_left_right"}},{"x":23,"y":1,"data":{"sprite":"block_left_right"}},{"x":19,"y":14,"data":{"sprite":"block_left_right"}},{"x":19,"y":13,"data":{"sprite":"block_left_right"}},{"x":19,"y":12,"data":{"sprite":"block_left_right"}},{"x":19,"y":11,"data":{"sprite":"block_left_right"}},{"x":19,"y":10,"data":{"sprite":"block_left_right"}},{"x":19,"y":9,"data":{"sprite":"block_left_right"}},{"x":19,"y":8,"data":{"sprite":"block_left_right"}},{"x":19,"y":7,"data":{"sprite":"block_left_right"}},{"x":19,"y":6,"data":{"sprite":"block_left_right"}},{"x":19,"y":5,"data":{"sprite":"block_left_right"}},{"x":19,"y":4,"data":{"sprite":"block_top_right"}},{"x":22,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":19,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":14,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":15,"data":{"sprite":"door","nextLevel":"2"}},{"x":20,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":14,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":11,"data":{"sprite":"block_top_bottom"}},{"x":14,"y":11,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":5,"data":{"sprite":"block_left_right"}},{"x":12,"y":6,"data":{"sprite":"block_left_right"}},{"x":12,"y":7,"data":{"sprite":"block_left_right"}},{"x":12,"y":8,"data":{"sprite":"block_left_right"}},{"x":12,"y":9,"data":{"sprite":"block_left_right"}},{"x":12,"y":10,"data":{"sprite":"block_left_right"}},{"x":16,"y":10,"data":{"sprite":"block_left_right"}},{"x":16,"y":9,"data":{"sprite":"block_left_right"}},{"x":16,"y":8,"data":{"sprite":"block_left_right"}},{"x":15,"y":11,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":7,"data":{"sprite":"block_end_top"}},{"x":19,"y":15,"data":{"sprite":"block_bottom"}},{"x":12,"y":11,"data":{"sprite":"block_bottom_left"}},{"x":16,"y":11,"data":{"sprite":"block_bottom_right"}},{"x":12,"y":4,"data":{"sprite":"block_top_left"}},{"x":14,"y":9,"data":{"sprite":"key"}}]''';

  static const level3 =
      //'''[{"x":0,"y":14,"data":{"sprite":"block_bottom_left"}},{"x":24,"y":0,"data":{"sprite":"block_top_right"}},{"x":0,"y":0,"data":{"sprite":"block_top_left"}},{"x":24,"y":14,"data":{"sprite":"block_bottom_right"}},{"x":1,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":0,"data":{"sprite":"block_top"}},{"x":14,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":1,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":14,"data":{"sprite":"block_bottom"}},{"x":14,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":19,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":0,"y":1,"data":{"sprite":"block_left_right"}},{"x":0,"y":2,"data":{"sprite":"block_left_right"}},{"x":0,"y":3,"data":{"sprite":"block_left_right"}},{"x":0,"y":4,"data":{"sprite":"block_left_right"}},{"x":0,"y":5,"data":{"sprite":"block_left_right"}},{"x":0,"y":6,"data":{"sprite":"block_left_right"}},{"x":0,"y":7,"data":{"sprite":"block_left_right"}},{"x":0,"y":8,"data":{"sprite":"block_left_right"}},{"x":0,"y":9,"data":{"sprite":"block_left_right"}},{"x":0,"y":10,"data":{"sprite":"block_left_right"}},{"x":0,"y":11,"data":{"sprite":"block_left_right"}},{"x":0,"y":12,"data":{"sprite":"block_left_right"}},{"x":0,"y":13,"data":{"sprite":"block_left_right"}},{"x":24,"y":1,"data":{"sprite":"block_left_right"}},{"x":24,"y":2,"data":{"sprite":"block_left_right"}},{"x":24,"y":3,"data":{"sprite":"block_left_right"}},{"x":24,"y":4,"data":{"sprite":"block_left_right"}},{"x":24,"y":5,"data":{"sprite":"block_left_right"}},{"x":24,"y":6,"data":{"sprite":"block_left_right"}},{"x":24,"y":7,"data":{"sprite":"block_left_right"}},{"x":24,"y":8,"data":{"sprite":"block_left_right"}},{"x":24,"y":10,"data":{"sprite":"block_left_right"}},{"x":24,"y":11,"data":{"sprite":"block_left_right"}},{"x":24,"y":12,"data":{"sprite":"block_left_right"}},{"x":24,"y":13,"data":{"sprite":"block_left_right"}},{"x":19,"y":0,"data":{"sprite":"door","nextLevel":"3"}},{"x":22,"y":12,"data":{"sprite":"enemy_turret","startAngle":"90","endAngle":"180","rangeRadius":"6"}},{"x":10,"y":2,"data":{"sprite":"enemy_turret","startAngle":"45","endAngle":"-45","rangeRadius":"6"}},{"x":2,"y":2,"data":{"sprite":"player_stand"}},{"x":5,"y":5,"data":{"sprite":"block_end_bottom"}},{"x":5,"y":4,"data":{"sprite":"block_left"}},{"x":5,"y":3,"data":{"sprite":"block_left_right"}},{"x":5,"y":2,"data":{"sprite":"block_left_right"}},{"x":5,"y":1,"data":{"sprite":"block_left_right"}},{"x":5,"y":6,"data":{"sprite":"block_bottom_right"}},{"x":4,"y":6,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":6,"data":{"sprite":"block_end_left"}},{"x":6,"y":12,"data":{"sprite":"enemy_turret","startAngle":"90","endAngle":"270","rangeRadius":"6"}},{"x":7,"y":9,"data":{"sprite":"block_end_right"}},{"x":4,"y":9,"data":{"sprite":"block_end_left"}},{"x":5,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":4,"data":{"sprite":"block_end_right"}},{"x":1,"y":13,"data":{"sprite":"key"}},{"x":13,"y":13,"data":{"sprite":"block_left_right"}},{"x":13,"y":12,"data":{"sprite":"block_left_right"}},{"x":13,"y":11,"data":{"sprite":"block_left_right"}},{"x":13,"y":10,"data":{"sprite":"block_left_right"}},{"x":13,"y":9,"data":{"sprite":"block_left"}},{"x":13,"y":8,"data":{"sprite":"block_left_right"}},{"x":13,"y":7,"data":{"sprite":"block_end_top"}},{"x":13,"y":6,"data":{"sprite":"door"}},{"x":13,"y":5,"data":{"sprite":"block_end_bottom"}},{"x":13,"y":4,"data":{"sprite":"block_left_right"}},{"x":13,"y":3,"data":{"sprite":"block_left_right"}},{"x":13,"y":2,"data":{"sprite":"block_left_right"}},{"x":13,"y":1,"data":{"sprite":"block_left_right"}},{"x":14,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":9,"data":{"sprite":"block_end_right"}},{"x":20,"y":9,"data":{"sprite":"block_end_left"}},{"x":21,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":24,"y":9,"data":{"sprite":"block_right"}},{"x":15,"y":12,"data":{"sprite":"key"}},{"x":21,"y":4,"data":{"sprite":"enemy_turret","startAngle":"0","endAngle":"180","rangeRadius":"6"}}]''';
      '''[{"x":0,"y":14,"data":{"sprite":"block_bottom_left"}},{"x":24,"y":0,"data":{"sprite":"block_top_right"}},{"x":0,"y":0,"data":{"sprite":"block_top_left"}},{"x":24,"y":14,"data":{"sprite":"block_bottom_right"}},{"x":1,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":0,"data":{"sprite":"block_top"}},{"x":6,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":0,"data":{"sprite":"block_top"}},{"x":14,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":1,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":14,"data":{"sprite":"block_bottom"}},{"x":14,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":19,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":0,"y":1,"data":{"sprite":"block_left_right"}},{"x":0,"y":2,"data":{"sprite":"block_left_right"}},{"x":0,"y":3,"data":{"sprite":"block_left_right"}},{"x":0,"y":4,"data":{"sprite":"block_left_right"}},{"x":0,"y":5,"data":{"sprite":"block_left_right"}},{"x":0,"y":6,"data":{"sprite":"block_left_right"}},{"x":0,"y":7,"data":{"sprite":"block_left_right"}},{"x":0,"y":8,"data":{"sprite":"block_left_right"}},{"x":0,"y":9,"data":{"sprite":"block_left_right"}},{"x":0,"y":10,"data":{"sprite":"block_left_right"}},{"x":0,"y":11,"data":{"sprite":"block_left_right"}},{"x":0,"y":12,"data":{"sprite":"block_left_right"}},{"x":0,"y":13,"data":{"sprite":"block_left_right"}},{"x":24,"y":1,"data":{"sprite":"block_left_right"}},{"x":24,"y":2,"data":{"sprite":"block_left_right"}},{"x":24,"y":3,"data":{"sprite":"block_left_right"}},{"x":24,"y":4,"data":{"sprite":"block_left_right"}},{"x":24,"y":5,"data":{"sprite":"block_left_right"}},{"x":24,"y":6,"data":{"sprite":"block_left_right"}},{"x":24,"y":7,"data":{"sprite":"block_left_right"}},{"x":24,"y":8,"data":{"sprite":"block_left_right"}},{"x":24,"y":10,"data":{"sprite":"block_left_right"}},{"x":24,"y":11,"data":{"sprite":"block_left_right"}},{"x":24,"y":12,"data":{"sprite":"block_left_right"}},{"x":24,"y":13,"data":{"sprite":"block_left_right"}},{"x":19,"y":0,"data":{"sprite":"door","nextLevel":"3"}},{"x":22,"y":12,"data":{"sprite":"enemy_turret","startAngle":"90","endAngle":"180","rangeRadius":"6"}},{"x":10,"y":2,"data":{"sprite":"enemy_turret","startAngle":"45","endAngle":"-45","rangeRadius":"6"}},{"x":2,"y":2,"data":{"sprite":"player_stand"}},{"x":5,"y":5,"data":{"sprite":"block_left_right"}},{"x":5,"y":4,"data":{"sprite":"block_left"}},{"x":5,"y":3,"data":{"sprite":"block_left_right"}},{"x":5,"y":2,"data":{"sprite":"block_left_right"}},{"x":5,"y":1,"data":{"sprite":"block_left_right"}},{"x":5,"y":6,"data":{"sprite":"block_bottom_right"}},{"x":4,"y":6,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":6,"data":{"sprite":"block_end_left"}},{"x":6,"y":12,"data":{"sprite":"enemy_turret","endAngle":"270","rangeRadius":"6","startAngle":"-90"}},{"x":7,"y":9,"data":{}},{"x":4,"y":9,"data":{}},{"x":5,"y":9,"data":{}},{"x":6,"y":9,"data":{}},{"x":6,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":4,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":4,"data":{"sprite":"block_end_right"}},{"x":1,"y":13,"data":{}},{"x":13,"y":13,"data":{"sprite":"block_left_right"}},{"x":13,"y":12,"data":{"sprite":"block_left_right"}},{"x":13,"y":11,"data":{"sprite":"block_left_right"}},{"x":13,"y":10,"data":{"sprite":"block_left_right"}},{"x":13,"y":9,"data":{"sprite":"block_left"}},{"x":13,"y":8,"data":{"sprite":"block_left_right"}},{"x":13,"y":7,"data":{"sprite":"block_end_top"}},{"x":13,"y":6,"data":{"sprite":"door"}},{"x":13,"y":5,"data":{"sprite":"block_end_bottom"}},{"x":13,"y":4,"data":{"sprite":"block_left_right"}},{"x":13,"y":3,"data":{"sprite":"block_left_right"}},{"x":13,"y":2,"data":{"sprite":"block_left_right"}},{"x":13,"y":1,"data":{"sprite":"block_left_right"}},{"x":14,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":9,"data":{"sprite":"block_end_right"}},{"x":20,"y":9,"data":{"sprite":"block_end_left"}},{"x":21,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":24,"y":9,"data":{"sprite":"block_right"}},{"x":15,"y":12,"data":{"sprite":"key"}},{"x":21,"y":4,"data":{"sprite":"enemy_turret","startAngle":"0","endAngle":"180","rangeRadius":"6"}},{"x":6,"y":2,"data":{}},{"x":7,"y":2,"data":{"sprite":"key"}}]''';

  static const level4 =
      '''[{"x":0,"y":0,"data":{"sprite":"block_top_left"}},{"x":34,"y":0,"data":{"sprite":"block_top_right"}},{"x":0,"y":19,"data":{"sprite":"block_bottom_left"}},{"x":0,"y":1,"data":{"sprite":"block_left_right"}},{"x":0,"y":2,"data":{"sprite":"block_left_right"}},{"x":0,"y":3,"data":{"sprite":"block_left_right"}},{"x":0,"y":4,"data":{"sprite":"block_left_right"}},{"x":0,"y":5,"data":{"sprite":"block_left_right"}},{"x":0,"y":6,"data":{"sprite":"block_left_right"}},{"x":0,"y":7,"data":{"sprite":"block_left_right"}},{"x":0,"y":8,"data":{"sprite":"block_left_right"}},{"x":0,"y":9,"data":{"sprite":"block_left"}},{"x":0,"y":10,"data":{"sprite":"block_left_right"}},{"x":0,"y":11,"data":{"sprite":"block_left_right"}},{"x":0,"y":12,"data":{"sprite":"block_left_right"}},{"x":0,"y":13,"data":{"sprite":"block_left_right"}},{"x":0,"y":14,"data":{"sprite":"block_left_right"}},{"x":0,"y":15,"data":{"sprite":"block_left"}},{"x":0,"y":16,"data":{"sprite":"block_left_right"}},{"x":0,"y":17,"data":{"sprite":"block_left_right"}},{"x":0,"y":18,"data":{"sprite":"block_left_right"}},{"x":34,"y":1,"data":{"sprite":"block_left_right"}},{"x":34,"y":2,"data":{"sprite":"block_left_right"}},{"x":34,"y":3,"data":{"sprite":"block_left_right"}},{"x":34,"y":4,"data":{"sprite":"block_left_right"}},{"x":34,"y":5,"data":{"sprite":"block_left_right"}},{"x":34,"y":7,"data":{"sprite":"block_left_right"}},{"x":34,"y":8,"data":{"sprite":"block_left_right"}},{"x":34,"y":9,"data":{"sprite":"block_left_right"}},{"x":34,"y":10,"data":{"sprite":"block_left_right"}},{"x":34,"y":11,"data":{"sprite":"block_left_right"}},{"x":34,"y":12,"data":{"sprite":"block_left_right"}},{"x":34,"y":13,"data":{"sprite":"block_left_right"}},{"x":1,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":12,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":14,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":0,"data":{"sprite":"block_top_right"}},{"x":19,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":24,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":25,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":26,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":27,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":28,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":29,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":30,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":31,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":32,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":33,"y":0,"data":{"sprite":"block_top_bottom"}},{"x":1,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":8,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":9,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":10,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":11,"y":19,"data":{"sprite":"block_bottom"}},{"x":12,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":13,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":14,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":15,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":16,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":19,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":19,"data":{"sprite":"block_bottom"}},{"x":21,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":24,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":25,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":26,"y":19,"data":{"sprite":"block_top_bottom"}},{"x":34,"y":6,"data":{"sprite":"door","nextLevel":"4"}},{"x":2,"y":17,"data":{"sprite":"player_stand"}},{"x":1,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":15,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":15,"data":{"sprite":"block_end_right"}},{"x":11,"y":10,"data":{"sprite":"block_left_right"}},{"x":11,"y":11,"data":{"sprite":"block_left_right"}},{"x":11,"y":12,"data":{"sprite":"block_left_right"}},{"x":11,"y":13,"data":{"sprite":"block_left_right"}},{"x":11,"y":14,"data":{"sprite":"block_left_right"}},{"x":11,"y":15,"data":{"sprite":"block_left_right"}},{"x":11,"y":16,"data":{"sprite":"block_left_right"}},{"x":11,"y":17,"data":{"sprite":"block_left_right"}},{"x":11,"y":18,"data":{"sprite":"block_left_right"}},{"x":2,"y":11,"data":{"sprite":"key"}},{"x":10,"y":9,"data":{"sprite":"door"}},{"x":11,"y":9,"data":{"sprite":"block_end_top"}},{"x":9,"y":9,"data":{"sprite":"block_end_right"}},{"x":8,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":7,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":6,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":5,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":4,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":2,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":1,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":3,"y":11,"data":{"sprite":"enemy_stand","targetPoint":"9,11"}},{"x":15,"y":1,"data":{"sprite":"block_end_bottom"}},{"x":18,"y":0,"data":{"sprite":"block_top_left"}},{"x":15,"y":2,"data":{"sprite":"block_left_right"}},{"x":15,"y":3,"data":{"sprite":"block_left_right"}},{"x":15,"y":4,"data":{"sprite":"block_left_right"}},{"x":15,"y":5,"data":{"sprite":"block_left_right"}},{"x":15,"y":6,"data":{"sprite":"block_left_right"}},{"x":15,"y":7,"data":{"sprite":"block_left_right"}},{"x":18,"y":1,"data":{"sprite":"block_left_right"}},{"x":18,"y":2,"data":{"sprite":"block_left_right"}},{"x":18,"y":3,"data":{"sprite":"block_left_right"}},{"x":18,"y":4,"data":{"sprite":"block_left_right"}},{"x":18,"y":5,"data":{"sprite":"block_bottom_left"}},{"x":19,"y":5,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":5,"data":{"sprite":"block_top_bottom"}},{"x":21,"y":5,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":5,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":6,"data":{"sprite":"block_left_right"}},{"x":23,"y":7,"data":{"sprite":"block_left_right"}},{"x":15,"y":8,"data":{"sprite":"block_left_right"}},{"x":23,"y":9,"data":{"sprite":"block_bottom_right"}},{"x":15,"y":9,"data":{"sprite":"block_bottom_left"}},{"x":16,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":17,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":18,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":19,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":20,"y":9,"data":{"sprite":"block_top"}},{"x":21,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":22,"y":9,"data":{"sprite":"block_top_bottom"}},{"x":23,"y":8,"data":{"sprite":"block_left_right"}},{"x":23,"y":5,"data":{"sprite":"block_top_right"}},{"x":20,"y":10,"data":{"sprite":"block_left_right"}},{"x":20,"y":11,"data":{"sprite":"block_left_right"}},{"x":20,"y":12,"data":{"sprite":"block_left_right"}},{"x":20,"y":13,"data":{"sprite":"block_left_right"}},{"x":20,"y":14,"data":{"sprite":"block_left_right"}},{"x":20,"y":15,"data":{"sprite":"block_left_right"}},{"x":20,"y":16,"data":{"sprite":"block_end_bottom"}},{"x":20,"y":18,"data":{"sprite":"block_end_top"}},{"x":20,"y":17,"data":{"sprite":"door"}},{"x":13,"y":17,"data":{"sprite":"enemy_stand","targetPoint":"18,11","hasKey":"true"}},{"x":27,"y":19,"data":{"sprite":"block_bottom_right"}},{"x":27,"y":18,"data":{"sprite":"block_left_right"}},{"x":27,"y":17,"data":{"sprite":"block_left_right"}},{"x":27,"y":16,"data":{"sprite":"block_left_right"}},{"x":27,"y":15,"data":{"sprite":"block_left_right"}},{"x":28,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":29,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":30,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":31,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":32,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":33,"y":14,"data":{"sprite":"block_top_bottom"}},{"x":27,"y":14,"data":{"sprite":"block_top_left"}},{"x":34,"y":14,"data":{"sprite":"block_bottom_right"}},{"x":22,"y":11,"data":{"sprite":"enemy_stand","targetPoint":"32,12"}},{"x":25,"y":2,"data":{"sprite":"enemy_stand","targetPoint":"31,8"}},{"x":20,"y":3,"data":{"sprite":"key"}},{"x":2,"y":2,"data":{"sprite":"enemy_stand","targetPoint":"13,2"}}]''';
}
