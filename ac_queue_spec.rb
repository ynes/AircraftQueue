require_relative 'ac_queue'

describe AcQueue do
  describe 'when boots' do
    it 'should create and initialize all size and type
        combinations queues in the priority order' do
      ac_queue = AcQueue.new
      expect(ac_queue.queues.size).to be(4)
      ordered_list = %w(passengerlarge passengersmall cargolarge cargosmall)
      expect(ac_queue.queues.keys).to eq(ordered_list)
    end
  end

  describe '#enqueue' do
    let(:ac_queue) { AcQueue.new }

    it 'adds aircrafts to the corresponding queue' do
      ac_queue.enqueue(Aircraft.new(type: 'passenger', size: 'large'))
      expect(ac_queue.queues['passengerlarge'].size).to eq 1
    end

    it 'should not add aircrafts with invalid parameters' do
      output = ac_queue.enqueue(Aircraft.new(type: 'other', size: 'medium'))
      expect(output).to eq('invalid type other, invalid size medium')
      expect(ac_queue.queues.values.all?(&:empty?)).to be(true)
    end

    it 'should not add other instances that are not aircrafts' do
      output = ac_queue.enqueue(type: 'passenger', size: 'large')
      expect(output).to eq('Not an aircraft instance')
      expect(ac_queue.queues.values.all?(&:empty?)).to be(true)
    end
  end

  describe '#dequeue' do
    let(:ac_queue) { AcQueue.new }

    context 'when queues are empty' do
      it 'returns nil' do
        expect(ac_queue.dequeue).to be_nil
      end
    end

    context 'when queues are not empty' do
      let(:cargosmall) { Aircraft.new(type: 'cargo', size: 'small') }
      let(:passengersmall_1) { Aircraft.new(type: 'passenger', size: 'small') }
      let(:cargolarge_1) { Aircraft.new(type: 'cargo', size: 'large') }
      let(:passengersmall_2) { Aircraft.new(type: 'passenger', size: 'small') }
      let(:passengerlarge) { Aircraft.new(type: 'passenger', size: 'large') }
      let(:cargolarge_2) { Aircraft.new(type: 'cargo', size: 'large') }

      before do
        ac_queue.enqueue(cargosmall)
        ac_queue.enqueue(passengersmall_1)
        ac_queue.enqueue(cargolarge_1)
        ac_queue.enqueue(passengersmall_2)
        ac_queue.enqueue(passengerlarge)
        ac_queue.enqueue(cargolarge_2)
      end

      it 'removes aircraft in a priority order' do
        expect(ac_queue.dequeue).to eq(passengerlarge)
        expect(ac_queue.dequeue).to eq(passengersmall_1)
        expect(ac_queue.dequeue).to eq(passengersmall_2)
        expect(ac_queue.dequeue).to eq(cargolarge_1)
        expect(ac_queue.dequeue).to eq(cargolarge_2)
        expect(ac_queue.dequeue).to eq(cargosmall)
        expect(ac_queue.dequeue).to be_nil
      end
    end
  end
end
