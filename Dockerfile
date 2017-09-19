FROM ruby:2.3.5-onbuild 
COPY bin/bitmap_editor /
ENTRYPOINT ["bin/bitmap_editor"]

