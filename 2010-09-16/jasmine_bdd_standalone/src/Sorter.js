var sortableInvoiceTable = (function($) {
  return function (th) {
    th = $(th);
    
    var valueFor = function (tr) {
      var td = $(tr).find('td.' + columnClass);
      var value = $.trim(td.attr('data-value'));
      return dataType === 'number' ? Number(value) : value.toLowerCase();
    };
    
    var dataType = th.attr('data-type');
    var columnClass = th.attr('data-ref');
    var tbody = th.parents('tbody');
    var rows = tbody.find('tr.invoice');
    var thead = tbody.find('tr.head');
    var total = tbody.find('tr.total');
    
    var direction = th.is('.asc') ? 'desc' : 'asc';
    
    var setHeadClass = function () {
      tbody.find('th').removeClass('asc').removeClass('desc');
      th.addClass(direction);
    };
    
    return {
      sort: function () {
        var values = $.map(rows, function(tr, index) {      
          return [[valueFor(tr), tr]];
        });
        
        var sortedValues = values.sort(function (a, b) {
          a = a[0]; b = b[0];
          
          if (direction === 'asc') {
            return a > b ? 1 : a < b ? -1 : 0;
          } else {
            return b > a ? 1 : b < a ? -1 : 0;
          }
        });
        
        setHeadClass();
        var newTbody = $('<tbody />');
        newTbody.append(thead);

        $.each(sortedValues, function(index, val) {
          newTbody.append(val[1]);
        });

        newTbody.append(total);

        tbody.replaceWith(newTbody);
      }
    };
  };
}(jQuery));

