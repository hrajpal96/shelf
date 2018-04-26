window.onload = function () {

  var chart1 = new CanvasJS.Chart("usersChart", {
    animationEnabled: true,
    theme: "light2",
    title: {
      text: "Visitors for the month February, 2018"
    },
    axisY: {
      includeZero: false
    },
    data: [{
      type: "line",
      color: "rgba(244,67,54,.7)",
      dataPoints: [
        { y: 450 },
        { y: 414 },
        { y: 520 },
        { y: 460 },
        { y: 450 },
        { y: 500 },
        { y: 480 },
        { y: 480 },
        { y: 410, indexLabel: "lowest", markerColor: "DarkSlateGrey", markerType: "cross" },
        { y: 500 },
        { y: 480 },
        { y: 510 },
        { y: 510 },
        { y: 525 },
        { y: 560 },
        { y: 505 },
        { y: 480 },
        { y: 550 },
        { y: 590 },
        { y: 605, indexLabel: "highest", markerColor: "red", markerType: "triangle" },
        { y: 570 },
        { y: 520 },
        { y: 490 },
        { y: 455 },
        { y: 485 },
        { y: 510 },
        { y: 550 },
        { y: 590 }
      ]
    }]
  });


  var chart2 = new CanvasJS.Chart("revenueChart", {
    animationEnabled: true,
    title: {
      text: "Website Revenue Over The Years"
    },
    axisY: {
      title: "Revenue in USD",
      valueFormatString: "#0,,.",
      suffix: "mn",
      prefix: "$"
    },
    data: [{
      type: "splineArea",
      color: "rgba(244,67,54,.7)",
      markerSize: 5,
      xValueFormatString: "YYYY",
      yValueFormatString: "$#,##0.##",
      dataPoints: [
        { x: new Date(2000, 0), y: 3289000 },
        { x: new Date(2001, 0), y: 3830000 },
        { x: new Date(2002, 0), y: 2009000 },
        { x: new Date(2003, 0), y: 2840000 },
        { x: new Date(2004, 0), y: 2396000 },
        { x: new Date(2005, 0), y: 1613000 },
        { x: new Date(2006, 0), y: 2821000 },
        { x: new Date(2007, 0), y: 2000000 },
        { x: new Date(2008, 0), y: 1397000 },
        { x: new Date(2009, 0), y: 2506000 },
        { x: new Date(2010, 0), y: 2798000 },
        { x: new Date(2011, 0), y: 3386000 },
        { x: new Date(2012, 0), y: 6704000 },
        { x: new Date(2013, 0), y: 6026000 },
        { x: new Date(2014, 0), y: 2394000 },
        { x: new Date(2015, 0), y: 1872000 },
        { x: new Date(2016, 0), y: 2140000 }
      ]
    }]
  });

  setTimeout(() => {
    chart1.render();
    chart2.render();
  }, 1000);

}
