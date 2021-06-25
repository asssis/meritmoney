
function json_to_table(json)
{
    type = jQuery.type(json);
    if(jQuery.type(json) == "array") {

        table = "<table class='table'>";
        table += "<tr>";
        table += "<thead>"
        $.each(json[0], function(key, value){
            table += "<th>"
            table += key
            table += "</th>"
        });
        table += "</tr>";
        table += "</thead>";

        table += "<tbody>"
        table += "<tr>";

        $.each(json, function(key, value) {
            table += "<tr>";
            $.each(value, function(key, value)
            {
                table += "<td>"
                table += value
                table += "</td>"
            });
            table += "</tr>";
        });

        table += "</table>";
    }
    return table
}