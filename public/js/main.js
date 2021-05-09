$(document).ready(function() {
    $('.delete-recipe').on('click', function() {
        var recipeId = $(this).data('id');
        var url = '/delete/' + recipeId;
        if(confirm('Are you sure you want to delete recipe?')) {
            $.ajax({
                url: url,
                type: 'DELETE',
                success: function(result) {
                    window.location.href='/';
                },
                error: function(err) {
                    console.error(err);
                }
            })
        }
    })
});