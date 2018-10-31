class Channel
  attr_reader :name, :id, :purpose, :is_archived, :members, :is_general

  def initialize(name, id, purpose: "", is_archived: 0, members: [], is_general: 0 )
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @id = id

    @purpose = purpose
    @is_archived = is_archived
    @is_general = is_general
    @members = members
  end
end
