import React, { useState, useEffect, useRef } from 'react';
import { AgGridReact } from 'ag-grid-react';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-alpine.css';

const GridExample = () => {
  const gridRef = useRef(null);
  const [rowData, setRowData] = useState([]);
  const [columnDefs] = useState([
    { headerName: "Make", field: "make", filter: true, sortable: true, rowGroup: true },
    { headerName: "Model", field: "model", filter: true, sortable: true },
    { headerName: "Price", field: "price", filter: true, sortable: true }
  ]);

  useEffect(() => {
    fetch('https://www.ag-grid.com/example-assets/row-data.json')
      .then(result => result.json())
      .then(rowData => setRowData(rowData));
  }, []);

  const onExportClick = () => {
    gridRef.current.api.exportDataAsCsv();
  };

  const onFilterTextBoxChanged = (event) => {
    gridRef.current.api.setQuickFilter(event.target.value);
  };

  return (
    <div>
      <input type="text" placeholder="Search..." onChange={onFilterTextBoxChanged} style={{ marginBottom: '10px' }} />
      <button onClick={onExportClick} style={{ marginBottom: '10px' }}>Export to CSV</button>
      <div className="ag-theme-alpine" style={{ height: 600, width: 800 }}>
        <AgGridReact
          ref={gridRef}
          rowData={rowData}
          columnDefs={columnDefs}
          defaultColDef={{ filter: true, sortable: true, resizable: true }}
          groupDisplayType={'groupRows'}
          pagination={true}
          paginationPageSize={10}
          domLayout='autoHeight'
          animateRows={true}
        >
        </AgGridReact>
      </div>
    </div>
  );
};

export default GridExample;
