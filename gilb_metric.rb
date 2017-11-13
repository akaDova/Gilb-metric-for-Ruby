class GilbMetric
  @@cond_ops = %w|while until if unless case when else|

  def initialize(text)
    @codeText = text.split(/\n/).select {|line| line != ''}
  end

  def show
    @op_count = @codeText.select {|line| !(/^(\bbegin\b)|(\bend\b)|(\bdef\b.*)$/ === line)}.length + 0.0
    @CL = @codeText.select {|line| /^.*(\bif\b.*)|(\bunless\b.*)|(\bwhen\b.*)|(\bwhile\b.*)|(\buntil\b.*)$/ === line}.length
    puts "CL: #{@CL}", "cl: #{@op_count / @CL}", "CLI: #{deep_level - 1 >= 0 ? deep_level - 1 : 0}"
  end

  private

  def max(a, b)
    a > b ? a : b
  end

  def deep_level
    op_stack = []
    when_op = 0
    @max_deep = 0
    case_flag = false
    @codeText.each do |line|
      (
      when_op += 1 if /^.*\bwhen\b.*$/ === line && !case_flag
      op_stack.push line if !case_flag
      case_flag = false
      @max_deep = max @max_deep, op_stack.length
      ) if %w|if unless while until when|.find {|op| /^.*\b#{op}\b.*$/ === line}
      (
      op_stack, when_op = [], 0 if when_op == op_stack.length
      op_stack.pop
      ) if /^.*\bend\b.*$/ === line
      (
      case_flag = true
      ) if /^.*\bcase\b.*$/ === line
    end
    return @max_deep
  end
end