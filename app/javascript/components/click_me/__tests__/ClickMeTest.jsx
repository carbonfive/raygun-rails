import React from 'react';
import { shallow } from 'enzyme';
import ClickMe from '../ClickMe';

describe('ClickMe Component', () => {
  let wrapper = null;
  describe('with no args', () => {
    beforeEach(() => {
      wrapper = shallow(<ClickMe />);
    });
    it('has the clickable class', () => {
      expect(wrapper.is('.clickable')).toEqual(true);
    });
    it('updates when you click it', () => {
      expect(wrapper.text()).toMatch(/Click Count: 0$/);
      expect(wrapper.find('button').text()).toEqual('Click Me');
      wrapper.simulate('click');
      wrapper.simulate('click');
      expect(wrapper.text()).toMatch(/Click Count: 2/);
    });
  });
  describe('with a name', () => {
    beforeEach(() => {
      wrapper = shallow(<ClickMe name="Bill" />);
    });
    it('includes the name', () => {
      expect(wrapper.find('button').text()).toEqual('Bill');
    });
  });
});
