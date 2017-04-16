import React from 'react';
import PropTypes from 'prop-types';
import ComponentRegistry from '../../services/ComponentRegistry';

class ClickMe extends React.Component {

  static defaultProps = {
    name: 'Click Me'
  };

  constructor(props) {
    super(props);
    this.state = Object.assign({ counter: 0 }, props);
  }

  // fat arrow gives the auto bind to this
  handleClick = () => {
    this.setState(previousState => ({
      counter: previousState.counter + 1
    }));
  }

  render() {
    return (
      <div className="clickable" onClick={this.handleClick}>
        <button>{this.state.name}</button>
        <div>
          Click Count: {this.state.counter}
        </div>
      </div>
    );
  }
}

ClickMe.propTypes = {
  name: PropTypes.string
};

ComponentRegistry.register('ClickMe', ClickMe);

export default ClickMe;
