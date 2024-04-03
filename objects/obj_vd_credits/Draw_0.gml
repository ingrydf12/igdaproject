// @ingryd" 
var video_Data = video_draw();
var video_Status = video_Data[0];
var creditsVideo = video_Data[1];
if (video_Status == 0){
	draw_surface_stretched(creditsVideo, 0, 0, room_width, room_height);
}

