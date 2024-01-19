class AllProjects extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      projects: [],
    };
  }
  componentDidMount() {
    fetch("/api/v1/projects.json")
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        this.setState({ projects: data });
      });
  }

  render() {
    var projects = this.state.projects.map((project) => {
      return (
        <div key={project.id}>
          <h1>{project.name}</h1>
        </div>
      );
    });

    return <div>{projects}</div>;
  }
}
