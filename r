import React, { useState, useEffect } from 'react';
import { AgGridReact } from 'ag-grid-react';
import { useParams } from 'react-router-dom';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

const GridComponent = () => {
  const [rowData, setRowData] = useState([]);
  const { id } = useParams();

  useEffect(() => {
    // Static data based on the ID parameter
    const staticData = {
      1: [
        { id: 1, name: 'John Doe', description: 'Software Engineer' },
        { id: 2, name: 'Jane Smith', description: 'Graphic Designer' },
      ],
      2: [
        { id: 3, name: 'Alice Johnson', description: 'Product Manager' },
        { id: 4, name: 'Bob Brown', description: 'Data Scientist' },
      ],
      // Add more static data sets as needed
    };

    setRowData(staticData[id] || []);
  }, [id]);

  const columnDefs = [
    { headerName: 'ID', field: 'id' },
    { headerName: 'Name', field: 'name' },
    { headerName: 'Description', field: 'description' },
    // Add more column definitions as needed
  ];

  return (
    <div className="ag-theme-alpine" style={{ height: '500px', width: '100%' }}>
      <AgGridReact
        columnDefs={columnDefs}
        rowData={rowData}
        pagination={true}
        paginationPageSize={10}
      />
    </div>
  );
};

export default GridComponent;
This component now uses static data based on the id parameter from the URL.

Here is the complete setup for your App component:

jsx
Copy code
import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import GridComponent from './GridComponent';

const App = () => {
  return (
    <Router>
      <Switch>
        <Route path="/grid/:id" component={GridComponent} />
      </Switch>
    </Router>
  );
};

export default App;
