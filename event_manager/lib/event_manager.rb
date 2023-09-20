require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

puts 'Event Manager Initialized!'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
  # if zipcode.nil?
  #   '0' * 5
  # elsif zipcode.length < 5
  #   '0' * (5 - zipcode.length) + zipcode
  # elsif zipcode.length > 5
  #   zipcode[0..4]
  # else
  #   zipcode
  # end
end

def clean_phone(phone)
  phone = phone.tr('()-. ', '').to_s
  len = phone.length

  return phone if len == 10

  return phone[1..phone.length] if phone[0] == '1' && len == 11

  ''
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    # civic_info.representative_info_by_address(
    #   address: zipcode,
    #   levels: 'country',
    #   roles: ['legislatorUpperBody', 'legislatorLowerBody']
    # ).officials

    # legislators_names = legislators.officials.map do |legislator|
    #   legislator.name
    # end
    # legislators_names = legislators.officials.map(&:name)

    # legislators_names.join(', ')
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_to_file(id, data)
  Dir.mkdir('output') unless Dir.exist?('output')

  File.open("output/thanks_#{id}.html", 'w') do |file|
    file.puts data
  end
end

template_letter = File.read('form_letter.erb')
template = ERB.new template_letter

filename = 'event_attendees.csv'
contents = CSV.open(
  filename,
  headers: true,
  header_converters: :symbol
)
reg_times = {}
reg_days = {}
contents.each do |row|
  id = row[:id]
  name = "#{row[:first_name]} #{row[:last_name]}"
  zipcode = clean_zipcode(row[:zipcode])
  phone = clean_phone(row[:homephone])
  reg_time = Time.strptime(row[:regdate], '%m/%d/%y %k:%M')
  day = reg_time.strftime('%A')
  reg_days[day] = 0 if reg_days[day].nil?
  reg_days[day] = reg_days[day] + 1

  hour = reg_time.hour
  reg_times[hour] = 0 if reg_times[hour].nil?
  reg_times[hour] = reg_times[hour] + 1

  # puts "#{name} - #{reg_date}"
  # legislators = legislators_by_zipcode(zipcode)

  # personal_letter = template_letter.gsub('FIRST_NAME', name)
  #                                  .gsub('LEGISLATORS', legislators)

  # puts "#{name} - #{zipcode} - #{legislators}"
  # puts "#{name} - #{phone}"

  # personal_letter = template.result(binding)

  # save_to_file(id, personal_letter)

  # puts personal_letter
end

p reg_days.sort_by(&:last)
p reg_times.sort_by(&:last)
