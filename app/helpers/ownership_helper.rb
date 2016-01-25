module OwnershipHelper

  def ownership
    [
      ['Select', nil],
      ['Sole Ownership', 'Sole Ownership'],
      ['Partnership', 'Partnership'],
      ['Public Corporation', 'Public Corporation'],
      ['Private Corporation', 'Private Corporation'],
      ['Limited Liability Company (LLC)', 'Limited Liability Company']
    ]
  end
end
