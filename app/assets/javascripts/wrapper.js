$(document).ready(function() {
    var historyWrapper = $('#history-wrapper'),
        sighsWrapper = $('#sighs-wrapper'),
        modal = $("#chart-modal");

    $('.toggle-history').on("click", function() {
        historyWrapper.toggleClass("menu-active");
        sighsWrapper.toggleClass("menu-active");
    });

    $('.toggle-modal').on("click", function() {
        modal.toggleClass("active");
    });

    renderChart(gon.data);
});


function renderChart(data) {
    var modal = $("#chart-modal");
    var margin = {top: 60, right: 60, bottom: 100, left: 150},
        width = modal.width() - margin.left - margin.right,
        height = modal.height() - margin.top - margin.bottom;

    var x = d3.scaleTime().range([0, width]);
    var y = d3.scaleLinear().range([height, 0]);


    var formatHour = function(d) {
        debugger;
        return parseInt(d);
    };

    var valueline = d3.line()
        .x(function(d) { return x(d[0]); })
        .y(function(d) { return y(d[1]); });

    var svg = d3.select("#chart-modal").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
            "translate(" + margin.left + "," + margin.top + ")");

    x.domain([0, 23]);
    y.domain([0, d3.max(data, function(d) { return d[1]; })]);

    svg.append("path")
        .data([data])
        .attr("class", "line")
        .attr("d", valueline);

    svg.append("g")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    svg.append("g")
        .call(d3.axisLeft(y));
}