'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('my app', function() {

  beforeEach(function() {
    browser().navigateTo('/');
  });


  it('should automatically redirect to /view1 when location hash/fragment is empty', function() {
    expect(browser().location().url()).toBe("/start");
  });


  describe('start', function() {

    beforeEach(function() {
      browser().navigateTo('#/start');
    });


    it('should render view1 when user navigates to /view1', function() {
      expect(element('[ng-view] p:first').text()).
          toMatch(/partial for view 1/);
    });

  });


  describe('contact', function() {

    beforeEach(function() {
      browser().navigateTo('#/contact');
    });


    it('should render view2 when user navigates to /view2', function() {
      expect(element('[ng-view] p:first').text()).
          toMatch(/partial for view 2/);
    });

  });
});
