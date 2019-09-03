import React from 'react';
import { shallow, configure } from 'enzyme';
import { shallowToJson } from 'enzyme-to-json';
import Adapter from 'enzyme-adapter-react-16';
import Root from './Root'

configure({ adapter: new Adapter() });

describe('Root', () => {
    it('should render correctly', () => {
        const output = shallow(
            <a title="mockTitle" url="mockUrl" />
        );
        expect(shallowToJson(output)).toMatchSnapshot();
    });
});

