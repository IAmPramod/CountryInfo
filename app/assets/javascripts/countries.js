var options = {
    'processing': true,
    'serverSide': false,
    'serverMethod': 'GET'
  };

$(document).ready(function(){
  options.ajax = $('#countries_list').data('url');
  $('#countries_list').dataTable(options);

  options.ajax = $('#country_states_list').data('url');
  $('#country_states_list').dataTable(options);
});