$(document).ready(function() {
    // On Click event for deleting recipe
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
            });
        }
    });
    // On Click event for editing recipe
    $('.edit-recipe').on('click', function() {
        $('#edit-name').val($(this).data('name'));
        $('#edit-type').val($(this).data('type'));
        $('#edit-preparationTime').val($(this).data('preparation-time'));
        $('#edit-difficulty').val($(this).data('difficulty'));
        $('#edit-ingredients').val($(this).data('ingredients'));
        $('#edit-description').val($(this).data('description'));
        $('#edit-photoUrl').val($(this).data('photo-url'));
        $('#edit-id').val($(this).data('id'));
    });
});
