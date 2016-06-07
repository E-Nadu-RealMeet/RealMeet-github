    $(document).on("click", "NoticesModal", function () {
    	var Notices = $(this).data('id');
        $('#NoticesModal').val( Notices );
    });    
}