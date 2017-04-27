get '/' do
  erb :index
end

get '/quiz' do
  if params['page_number']
    @page_number = params['page_number']
  else
    @page_number = 0 unless params['page_number']
  end

  @correct_answer_count = params['correct_answer_count'] || 0
  @correct_answer_count.to_i
  puts params['last_answer_correct']
  @correct_answer_count += 1 if params['last_answer_correct'] == "true"

  @next_image_number = @page_number +1
  @image_to_display = find_file_for_page_number @page_number

 correct_answer = determine_answer_string @image_to_display.dup

  @landfill=false
  @recycle=false
  @compost=false


  case correct_answer
  when 'landfill'
    @landfill = true
  when 'recycle'
    @recycle = true
  when 'compost'
    @compost = true
  end



  unless request.xhr?
    erb :quiz
  else
    erb :quiz, layout: false
  end
end

# Helper methods

def find_file_for_page_number page_number
  array_of_jpgs_in_public_folder =  Dir["./public/*.jpg"].sort!
  if array_of_jpgs_in_public_folder[page_number]
    single_file_path_with_public_folder = array_of_jpgs_in_public_folder[page_number]
    return path_for_erb_template = single_file_path_with_public_folder.sub("./public", '')
  else
    return nil
  end
end

def determine_answer_string image_file_name
  image_file_name.chomp!('.jpg')
  while image_file_name.include?("-")
    image_file_name.reverse!.chop!.reverse!
  end
  image_file_name
end


# /1-compost.jpg