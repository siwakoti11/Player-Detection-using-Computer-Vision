function soccer_analysis(input_image)

    input_image = double(input_image);
    reds = input_image(:,:,1);
    greens = input_image(:,:,2);
    blues = input_image(:,:,3);

    field = ((greens - reds > 0) & (greens - blues > 0));
    field = remove_holes(field);
    field = bwareafilt((field > 1), 1);
    figure(1);
    imshow(field, []);

    red_players = ((reds - greens > 100) & (reds - blues > 100));
    red_players = (field > 0 & red_players > 0);
    figure(2);
    imshow(red_players, []);

    blue_players = ((blues - greens > 40) & (blues - reds > 30));
    blue_players = (field > 0 & blue_players > 0);
    figure(3);
    imshow(blue_players, []);

end

