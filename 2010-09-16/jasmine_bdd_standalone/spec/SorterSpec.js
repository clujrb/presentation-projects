describe('Sorting invoice tables', function () {
  var $ = jQuery, th;
  
  beforeEach(function() {
    fixture([
      ['%table',
        ['%tbody',
          ['%tr.head',
            ['%th.sortable.total', {'data-ref':'total', 'data-type':'number'}, 'Total'],
            ['%th.sortable.name',  {'data-ref':'name',  'data-type':'string'}, 'Name']
          ],
          ['%tr.invoice',
            ['%td.total', { 'data-value': '500' }, 'v500'],
            ['%td.name',  { 'data-value': 'foo' }, 'vFoo']
          ],
          ['%tr.invoice',
            ['%td.total', { 'data-value': '5000' }, 'v5000'],
            ['%td.name',  { 'data-value': 'fooo' }, 'vFooo']
          ],
          ['%tr.invoice',
            ['%td.total', { 'data-value': '50' }, 'v50'],
            ['%td.name',  { 'data-value': 'fo' }, 'vFo']
          ],
          ['%tr.total',
            ['%td', '5550']
          ]
        ]
      ]
    ]);
    
    this.addMatchers({
      toSortAscending: function () {
        var col = this.actual;
        return col.is('.asc') && !col.is('.desc');
      },
      
      toSortDescending: function () {
        var col = this.actual;
        return col.is('.desc') && !col.is('.asc');
      }
    });
  });
  
  var columnValues = function (name) {
    return $.map($('tr.invoice'), function(item, index) {
      return $(item).find('.' + name).html();
    });
  };
  
  var expectColumnValuesToEqual = function (tdClass, values) {
    expect($.map($('tr.invoice'), function(item, index) {
      return $(item).find('.total').html();
    })).toEqual(['v50', 'v500', 'v5000']);
  };
  
  describe('sorting numbers', function() {
    beforeEach(function() {
      th = $('th.total');
    });
    
    describe('ascending', function() {
      beforeEach(function() {
        sortableInvoiceTable(th).sort();
      });
      
      it('sets the rows in the right order', function() {
        expect(columnValues('total')).toEqual(['v50', 'v500', 'v5000']);
      });

      it('sets the <th> class to "asc"', function() {
        expect(th).toSortAscending();
      });
      
      it('keeps the head and total rows', function() {
        expect($('tr.head').length).toEqual(1);
        expect($('tr.total').length).toEqual(1);
      });
    });
    
    describe('descending', function() {
      beforeEach(function() {
        th.addClass('asc');
        sortableInvoiceTable(th).sort();
      });
      
      it('sets the rows in the right order', function() {
        expect(columnValues('total')).toEqual(['v5000', 'v500', 'v50']);
      });

      it('sets the <th> class to "desc"', function() {
        expect(th).toSortDescending();
      });
      
      it('keeps the head and total rows', function() {
        expect($('tr.head').length).toEqual(1);
        expect($('tr.total').length).toEqual(1);
      });
    });
    
  });
  
  describe('sorting strings', function() {
    beforeEach(function() {
      th = $('th.name');
    });
    
    describe('ascending', function() {
      beforeEach(function() {
        sortableInvoiceTable(th).sort();
      });
      
      it('sets the rows in the right order', function() {
        expect(columnValues('name')).toEqual(['vFo', 'vFoo', 'vFooo']);
      });

      it('sets the <th> class to "asc"', function() {
        expect(th).toSortAscending();
      });
      
      it('keeps the head and total rows', function() {
        expect($('tr.head').length).toEqual(1);
        expect($('tr.total').length).toEqual(1);
      });
    });
    
    describe('descending', function() {
      beforeEach(function() {
        th.addClass('asc');
        sortableInvoiceTable(th).sort();
      });
      
      it('sets the rows in the right order', function() {
        expect(columnValues('name')).toEqual(['vFooo', 'vFoo', 'vFo']);
      });

      it('sets the <th> class to "desc"', function() {
        expect(th).toSortDescending();
      });
      
      it('keeps the head and total rows', function() {
        expect($('tr.head').length).toEqual(1);
        expect($('tr.total').length).toEqual(1);
      });
    });
  });
});
