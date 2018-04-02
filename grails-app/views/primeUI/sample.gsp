<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="primeui" />
    <g:set var="entityName" value="${message(code: 'primeUI.label', default: 'PrimeUI')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script>
        $(function() {
            $('#in').puiinputtext();

            //auto complete
            var countries = new Array("Afghanistan", "Albania", "Algeria", "Andorra", "BMW","Prominic","foo","book");

            var themes = new Array('afterdark', 'afternoon', 'afterwork', 'aristo', 'black-tie', 'blitzer', 'bluesky', 'bootstrap', 'casablanca', 'cruze',
                    'cupertino', 'dark-hive', 'dot-luv', 'eggplant', 'excite-bike', 'flick', 'glass-x', 'home', 'hot-sneaks', 'humanity', 'le-frog', 'midnight',
                    'mint-choc', 'overcast', 'pepper-grinder', 'redmond', 'rocket', 'sam', 'smoothness', 'south-street', 'start', 'sunny', 'swanky-purse', 'trontastic',
                    'ui-darkness', 'ui-lightness', 'varder');

            $('#basic').puiautocomplete({
                completeSource: countries
            });

            $('#dropdown').puiautocomplete({
                completeSource: countries,
                dropdown: true
            });

            $('#customcontent').puiautocomplete({
                completeSource: themes,
                content: function(data) {
                    return '<img src="assets/demo/images/themes/' + data.label + '.png" alt="" /><span style="float:right;font-size:14px">'
                            + data.label + '</span>';
                }
            });

            $('#multiple').puiautocomplete({
                completeSource: countries,
                multiple: true,
                select: function(event, item) {
                    $('#growl').puigrowl('show', [{severity: 'info', summary: 'City Selected', detail: item.data('label')}]);
                },
                unselect: function(event, item) {
                    $('#growl').puigrowl('show', [{severity: 'info', summary: 'City Unselected', detail: item.data('label')}]);
                }
            });

            $('#remote').puiautocomplete({
                effect: 'fade',
                effectSpeed: 'fast',
                completeSource: function(request, response) {
                    //in a real application, make a call to a remote url by passing the request.query as parameter
                    $.ajax({
                        type: "GET",
                        url: 'showcase/resources/data/themes.json',
                        dataType: "json",
                        context: this,
                        success: function(data) {
                            var filtered = [];
                            for(var i = 0; i < data.length; i++) {
                                if(data[i].label.indexOf(request.query) === 0) {
                                    filtered.push(data[i]);
                                }
                            }
                            response.call(this, filtered);
                        }
                    });
                }
            });

            $('#growl').puigrowl();



        });

    </script>
</head>
<body>


<div>
    <h3 class="first">Inputtext</h3>
    <h3 class="first">Basic</h3>
    <input id="in" type="text" size="30"/>
    <h3>PrimeElement</h3>
    <input type="text" is="p-inputtext" value="" size="30" />


    <h3 class="first">AutoComplete</h3>
    <h3 class="title title-short" style="margin-top: 0px;">Basic</h3>
    <input id="basic" name="basic" type="text"/>
    <h3 class="title title-short">Dropdown</h3>
    <input id="dropdown" name="dropdown" type="text"/>

    <h3 class="title title-short">Multiple</h3>
    <input id="multiple" name="multiple" type="text"/>

    <h3 class="title title-short">Remote</h3>
    <input id="remote" name="remote" type="text"/>
    <div id="growl"></div>
</div>
</body>
</html>