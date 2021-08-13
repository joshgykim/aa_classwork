require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../problems/ar_queries.rb'

describe 'star_wars_movies' do
  subject { star_wars_movies.as_json }
  
  let(:expected_result) {
    [
      { id: 1, title: "Star Wars", yr: 1977 },
      { id: 5, title: "Star Wars: Episode V - The Empire Strikes Back", yr: 1980 },
      { id: 13, title: "Star Wars: Episode VI - Return of the Jedi", yr: 1983 },
      { id: 17, title: "Star Wars: Episode I - The Phantom Menace", yr: 1999 }
    ].map{ |el| el.stringify_keys }
  } 
    
  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
  
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
    expect(subject).to contain_exactly(*expected_result)
  end
end

describe 'stewart_movies' do
  subject { stewart_movies.as_json }
  
  let(:expected_result) {
    [
      { id: 631, title: "Robin Hood: Men in Tights", score: 5.3},
      { id: 506, title: "Prince of Egypt, The", score: 7.2},
      { id: 311, title: "Conspiracy Theory", score: 6.5},
      { id: 68, title: "Star Trek: First Contact", score: 7.2},
      { id: 276, title: "Excalibur", score: 7.4},
      { id: 92, title: "X-Men", score: 7.8},
      { id: 280, title: "Star Trek: Generations", score: 6.0},
      { id: 252, title: "Star Trek: Insurrection", score: 6.4}
    ].map{ |el| el.stringify_keys }
  }

  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
  
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
    expect(subject).to contain_exactly(*expected_result)
  end
end

describe 'actor_ids_from_grease' do
	subject { actor_ids_from_grease }

	it 'retrieves the correct information' do
		expect(subject).to contain_exactly(
		  34, 317, 1413, 1764, 2956, 3434, 3832, 4136
    )
	end
  
  it 'hits the database exactly once' do
    expect{ subject.as_json }.to make_database_queries(count: 1)
    expect(subject).to contain_exactly(
      34, 317, 1413, 1764, 2956, 3434, 3832, 4136
    )
  end
end

describe 'al_pacino_not_number_one' do
  subject { al_pacino_not_number_one.as_json }
  
  let(:expected_result) {
    [
      {id: 136, title: "Devil's Advocate, The"},
      {id: 567, title: "Dick Tracy"},
      {id: 498, title: "Dog Day Afternoon"},
      {id: 12, title: "Godfather, The"}
    ].map{ |el| el.stringify_keys }
  }

  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
  
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
    expect(subject).to contain_exactly(*expected_result)
  end
end

describe 'smallest_cast' do
  subject { smallest_cast.as_json }

  let(:expected_result) {
    [
      { id: 905, title: "Wallace & Gromit: A Grand Day Out" },
      { id: 165, title: "Wallace & Gromit: The Wrong Trousers" },
      { id: 383, title: "Wallace & Gromit: A Close Shave" }
    ].map{ |el| el.stringify_keys }
  }

  it 'retrieves the correct information' do
    expect(subject).to contain_exactly(*expected_result)
  end
  
  it 'hits the database exactly once' do
    expect{ subject }.to make_database_queries(count: 1)
    expect(subject).to contain_exactly(*expected_result)
  end
end