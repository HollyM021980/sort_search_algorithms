describe('bubbleSort', function(){
  'use strict';

  beforeEach(var arr=[3,4,9,15,34,12,1,99,14]);

  it('should match', function(){
    expect(arr.bubbleSort()).toBe([1,3,4,9,12,14,15,34,99]);
  })
});
