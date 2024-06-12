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
