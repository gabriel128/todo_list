require 'spec_helper'

describe Task do

  context 'valid task' do
    it 'has to have less than 255 chars' do
      expect(build(:task)).to be_valid
    end

    it 'the priority has to be between 1 and 10' do
      expect(build(:task)).to be_valid
    end

    it 'Due date has to be in the future' do
      expect(build(:task)).to be_valid
    end

    it 'has to be done when it is' do
      a_task = build(:task, done: true)
      expect(a_task.done?).to be_true
    end
  end

  context 'invalid task' do
    it 'can not have 0 chars in description' do
      expect(build(:task, description: '')).to be_invalid
    end

    it 'has not to have more than 255 chars' do
      expect(build(:invalid_task)).to be_invalid
    end

    it 'the priority has not to be below 1' do
      expect(build(:task, priority: -1)).to be_invalid
    end

    it 'the priority has not to be after 10' do
      expect(build(:task,  priority: 11)).to be_invalid
    end

    it 'Due date has not to be in the past' do
      expect(build(:task, due_date: 1.day.ago)).to be_invalid
    end
  end
end
