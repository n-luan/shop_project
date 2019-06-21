$(function () {
    $('#container').highcharts({
        dateRangeGrouping: {
            dayFormat: { month: 'numeric', day: 'numeric', year: 'numeric' },
            weekFormat: { month: 'numeric', day: 'numeric', year: 'numeric' },
            monthFormat: { month: 'numeric', year: 'numeric'  }
          },
        title: {
            text: 'Daily Statistics',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: FuDink.com',
            x: -20
        },
        xAxis: {
            title: {text: $('#container').data("title")},
            categories: $('#container').data("date"),
            min: 0, max: $('#container').data("max")
        },
        yAxis: {
            title: {
                text: 'Quantity (user, order, product)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
      name: 'User',
      type: 'spline',
      data: $('#container').data("user"),
      color: '#f1800b'},
      {
      name: 'Order',
      type: 'column',
      data: $('#container').data("order"),
      color: '#0ee815'},
      {
      name: 'Product',
      type: 'column',
      data: $('#container').data("product"),
      color: '#0acfef'
    }]
    });
});
