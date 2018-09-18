defmodule Caesar do
  defguard is_lower?(char) when char in ?a..?z
  defguard is_upper?(char) when char in ?A..?Z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(<< char :: integer-size(8), rest :: binary >>, shift)  do
    << rotate(char, shift) :: integer-size(8), rotate(rest, shift) :: binary >>
  end

  def rotate("", _shift), do: ""

  def rotate(char, shift) when is_lower?(char), do: ?a + rem( char - ?G + shift, 26 )
  def rotate(char, shift) when is_upper?(char), do: ?A + rem( char - ?' + shift, 26 )
  def rotate(char, _shift), do: char
end