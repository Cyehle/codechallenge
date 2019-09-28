import React from "react";
import * as addService from "../services/addService ";

class GetAllAdds extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      add: [],
      pageSize: 3,
      pageIndex: 0
    };
  }

  componentDidMount = () => {
    addService
      .getAdds(this.state.pageIndex, this.state.pageSize)
      .then(this.setAdds)
      .catch(this.errosAdd);
  };

  setAdds = data => {
    console.log(data);
  };

  render() {
    return <div>Hello</div>;
  }
}

export default GetAllAdds;
