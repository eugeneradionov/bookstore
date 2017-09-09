# frozen_string_literal: true

module Helpers
  def self.books_seed
    titles = ['Ultra Monster',
              'Case of the Missing Nuclear Men',
              'Legend of Nuclear Woman',
              'Journey of the Red World',
              'Flying Woman',
              'Red Witch',
              'Legend of Green Wolves',
              'Champagne Tentacle',
              'Bloody Brains',
              'American Dreams',
              'Red Cat',
              'The Forbidden Dreams',
              'American Monster',
              'Season of the Killer Identity',
              'Champagne Clash',
              'Flying Cousins',
              'Hungry Rain',
              'Blue Fly',
              'Curse of the Electric Beast',
              'Champagne Pickpocket',
              'Forbidden Diaries',
              'Time of the Hungry Witch',
              'Planet of the Tokyo World',
              'I Married a Red Tears',
              'Flying Mutant',
              'Ultra Brain',
              'The Dangerous Identity',
              'A Fistful of Champagne Thief',
              'Case of the Missing Champagne Demon',
              'Forbidden Cousins']

    titles.each do |title|
      FactoryGirl.create(:book, title: title)
    end
  end
end
