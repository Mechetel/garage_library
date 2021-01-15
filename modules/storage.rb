require 'yaml'

# module Storage
module Storage
  FILE_PATH = 'db/data.yaml'.freeze

  def save_yml(data, file_path = FILE_PATH)
    make_files(file_path)
    File.open(file_path, 'w') { |f| YAML.dump(data, f) }
  end

  def load_yml(file_path = FILE_PATH)
    make_files(file_path)
    list = [Author, Book, Reader, Order, Date, Symbol]
    YAML.safe_load(File.read(file_path), list, [], [], true).to_a
  end

  def make_files(file_path = FILE_PATH)
    Dir.mkdir('db') unless Dir.exist?('db')
    File.new(file_path, 'w') unless File.exist?(file_path)
  end
end
