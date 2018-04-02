<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="primeui" />
        <g:set var="entityName" value="${message(code: 'primeUI.label', default: 'PrimeUI')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script>


            $(function() {

                var themes = new Array('afterdark', 'afternoon', 'afterwork', 'aristo', 'black-tie', 'blitzer', 'bluesky', 'bootstrap', 'casablanca', 'cruze',
                        'cupertino', 'dark-hive', 'dot-luv', 'eggplant', 'excite-bike', 'flick', 'glass-x', 'home', 'hot-sneaks', 'humanity', 'le-frog', 'midnight',
                        'mint-choc', 'overcast', 'pepper-grinder', 'redmond', 'rocket', 'sam', 'smoothness', 'south-street', 'start', 'sunny', 'swanky-purse', 'trontastic',
                        'ui-darkness', 'ui-lightness', 'varder','aristo');

//                $('#dropdown').puiautocomplete({
//                    completeSource: themes,
//                    dropdown: true
//                });

                $('#dropdown').puidropdown({
                    data: themes,
                    change:function(){

                        $.ajax({
                            type: "GET",
                            url: '/primeUI/switchStyle?style='+this.value,
                            dataType: "text",
                            context: this,
                            success: function(response) {
                                location.reload(true)
                            }
                        });
                    },

                });





                $('#mb1').puimenubar();

                var localData = [
                    {'title': 'Volkswagen', 'releaseYear': 2012, 'description': 'White', 'author': 'dsad231ff'},
                    {'title': 'Audi', 'releaseYear': 2011, 'description': 'Black', 'author': 'gwregre345'},
                    {'title': 'Renault', 'releaseYear': 2005, 'description': 'Gray', 'author': 'h354htr'},
                    {'title': 'BMW', 'releaseYear': 2003, 'description': 'Blue', 'author': 'j6w54qgh'},
                    {'title': 'Mercedes', 'releaseYear': 1995, 'description': 'White', 'author': 'hrtwy34'},
                    {'title': 'Volvo', 'releaseYear': 2005, 'description': 'Black', 'author': 'jejtyj'},
                    {'title': 'Honda', 'releaseYear': 2012, 'description': 'Yellow', 'author': 'g43gr'},
                    {'title': 'Jaguar', 'releaseYear': 2013, 'description': 'White', 'author': 'greg34'},
                    {'title': 'Ford', 'releaseYear': 2000, 'description': 'Black', 'author': 'h54hw5'},
                    {'title': 'Fiat', 'releaseYear': 2013, 'description': 'Red', 'author': '245t2s'}
                ];


                $('#tblremoteeager').puidatatable({
                    caption: 'Remote Grails Server JSON data - Eager',
                    paginator: {
                        rows: 5
                    },
                    columns: [
                        {field: 'title', headerText: 'Title',sortable: true},
                        {field: 'author', headerText: 'Author',sortable: true},
                        {field: 'releaseYear', headerText: 'Year',sortable: true},
                        {field: 'description', headerText: 'Description',sortable: true}
                    ],
                    datasource: function(callback) {
                        $.ajax({
                            type: "GET",
                            url: '/primeUI/indexJson',
                            dataType: "json",
                            context: this,
                            success: function(response) {
                                callback.call(this, response);
                            }
                        });
                    },
                    draggableRows: true,
                    draggableColumns : true,
                    selectionMode: 'single',
                    rowSelect: function(event, data) {
                        $('#messages').puigrowl('show', [{severity: 'info', summary: 'Row Selected', detail: (data.title + ' : ' + data.author)}]);
                    },
                    rowUnselect: function(event, data) {
                        $('#messages').puigrowl('show', [{severity: 'info', summary: 'Row Unselected', detail: (data.title + ' : ' + data.author)}]);
                    }




                    });
                $('#messages').puigrowl();



            });

        function changeStytle(){

            alert(style);
        }



        </script>
    </head>
    <body>
    <div align="right">
     Page Template Switch:
        <input id="dropdown" name="dropdown" type="text" change="changeStytle()"/>
        &nbsp;  : ${session.templateStyle} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <a href="#list-primeUI" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div >
            <ul id="mb1">
                <li> <a data-icon="fa-home" href="${createLink(uri: '/')}">Home</a>

                </li>
                <li> <a data-icon="fa-plus" href="/primeUI/create">New PrimeUI</a>

                </li>

                <li>
                    <a data-icon="fa-close">Quit</a>
                </li>
            </ul>


        </div>
        <div id="list-primeUI" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div id="tblremoteeager"></div>

            <div id="messages"></div>



        </div>
    </body>
</html>
