# Ruby Bitmap Editor

This is a fairly simple Ruby 2.3.X program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.

## Program input
The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.
Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

## Commands
There are 6 supported commands:
 - I M N - Create a new M x N image with all pixels coloured white (O).
 - C - Clears the table, setting all pixels to white (O).
 - L X Y C - Colours the pixel (X,Y) with colour C.
 - V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
 - H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
 - S - Show the contents of the current image

## Running the app

### Docker

Assuming you have Docker installed on your machine ([Mac guide here](https://docs.docker.com/docker-for-mac/), and [Windows guide here](https://docs.docker.com/docker-for-windows/install/)), and the Docker daemon is running, you can utilise it as follows:

1. Build the container: `docker build -t bitmap_editor .`
2. Run the app: `docker run bitmap_editor bin/bitmap_editor path/to/input/file.txt`

You can run the specs inside the Docker container with the following command:

`docker run bitmap_editor rspec`

### Native

The app uses Ruby 2.3.5. Assuming you have this installed on your machine, you can run the app as follows:

1. Download Gem dependencies: `bundle`
2. Run the app: `bin/bitmap_editor path/to/input/file.txt`

You can run the specs with the `rspec` command.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JoshToper/bitmap_editor.
