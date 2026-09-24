class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    split_line.last.strip
  end

  def log_level
    split_line.first.delete("[]").downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end

  private

  def split_line
    @line.split(":")
  end
end
