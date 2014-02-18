require 'spec_helper'

describe Task do

  context 'valid task' do
    it { build(:task).should be_valid }
    it { build(:task, done: true).done?.should be_true }
  end

  context 'invalid task' do
    it { build(:task, description: nil).should be_invalid }

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
