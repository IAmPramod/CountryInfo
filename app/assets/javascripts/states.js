var options = {
    'processing': true,
    'serverSide': false,
    'serverMethod': 'GET'
  };

$(document).ready(function(){
  options.ajax = $('#state_cities_list').data('url');
  $('#state_cities_list').dataTable(options);
});