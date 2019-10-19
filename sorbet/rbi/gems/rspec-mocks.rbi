# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rspec-mocks/all/rspec-mocks.rbi
#
# rspec-mocks-2.14.5
module RSpec
end
module RSpec::Mocks
  def self.allow_message(subject, message, opts = nil, &block); end
  def self.any_instance_recorder_for(klass); end
  def self.configuration; end
  def self.expect_message(subject, message, opts = nil, &block); end
  def self.method_handle_for(object, method_name); end
  def self.proxies_of(klass); end
  def self.proxy_for(object); end
  def self.setup(host); end
  def self.space; end
  def self.space=(arg0); end
  def self.teardown; end
  def self.verify; end
end
module RSpec::Mocks::Deprecation
  def deprecate(deprecated, options = nil); end
end
module RSpec::Mocks::InstanceExec
end
class RSpec::Mocks::InstanceMethodStasher
  def initialize(klass, method); end
  def method_defined_directly_on_klass?; end
  def method_defined_on_klass?(klass = nil); end
  def method_is_stashed?; end
  def method_owned_by_klass?; end
  def restore; end
  def stash; end
  def stashed_method_name; end
end
class RSpec::Mocks::MethodDouble < Hash
  def add_default_stub(*args, &implementation); end
  def add_expectation(error_generator, expectation_ordering, expected_from, opts, &implementation); end
  def add_stub(error_generator, expectation_ordering, expected_from, opts = nil, &implementation); end
  def any_instance_class_recorder_observing_method?(klass); end
  def build_expectation(error_generator, expectation_ordering); end
  def clear; end
  def configure_method; end
  def define_proxy_method; end
  def expectations; end
  def initialize(object, method_name, proxy); end
  def method_name; end
  def object; end
  def object_singleton_class; end
  def original_method; end
  def original_method_from_ancestor(ancestors); end
  def original_method_from_ancestry; end
  def original_method_from_superclass; end
  def original_unrecorded_any_instance_method; end
  def raise_method_not_stubbed_error; end
  def remove_single_stub(stub); end
  def remove_stub; end
  def reset; end
  def restore_original_method; end
  def restore_original_visibility; end
  def stubs; end
  def verify; end
  def visibility; end
  def visibility_for_method; end
end
class Anonymous_Struct_1 < Struct
  def method_name; end
  def method_name=(_); end
  def object; end
  def object=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class RSpec::Mocks::MethodDouble::ProcWithBlock < Anonymous_Struct_1
  def call(*args, &block); end
end
module RSpec::Mocks::ArgumentMatchers
  def a_kind_of(klass); end
  def an_instance_of(klass); end
  def any_args; end
  def anything; end
  def anythingize_lonely_keys(*args); end
  def boolean; end
  def duck_type(*args); end
  def hash_excluding(*args); end
  def hash_including(*args); end
  def hash_not_including(*args); end
  def instance_of(klass); end
  def kind_of(klass); end
  def no_args; end
end
class RSpec::Mocks::ArgumentMatchers::AnyArgsMatcher
  def description; end
end
class RSpec::Mocks::ArgumentMatchers::AnyArgMatcher
  def ==(other); end
  def initialize(ignore); end
end
class RSpec::Mocks::ArgumentMatchers::NoArgsMatcher
  def description; end
end
class RSpec::Mocks::ArgumentMatchers::RegexpMatcher
  def ==(value); end
  def initialize(regexp); end
end
class RSpec::Mocks::ArgumentMatchers::BooleanMatcher
  def ==(value); end
  def initialize(ignore); end
end
class RSpec::Mocks::ArgumentMatchers::HashIncludingMatcher
  def ==(actual); end
  def description; end
  def initialize(expected); end
end
class RSpec::Mocks::ArgumentMatchers::HashExcludingMatcher
  def ==(actual); end
  def description; end
  def initialize(expected); end
end
class RSpec::Mocks::ArgumentMatchers::DuckTypeMatcher
  def ==(value); end
  def initialize(*methods_to_respond_to); end
end
class RSpec::Mocks::ArgumentMatchers::MatcherMatcher
  def ==(value); end
  def initialize(matcher); end
end
class RSpec::Mocks::ArgumentMatchers::EqualityProxy
  def ==(expected); end
  def initialize(given); end
end
class RSpec::Mocks::ArgumentMatchers::InstanceOf
  def ==(actual); end
  def initialize(klass); end
end
class RSpec::Mocks::ArgumentMatchers::KindOf
  def ==(actual); end
  def initialize(klass); end
end
module RSpec::Mocks::ExampleMethods
  def allow(target); end
  def allow_any_instance_of(klass); end
  def allow_message_expectations_on_nil; end
  def declare_double(declared_as, *args); end
  def double(*args); end
  def expect_any_instance_of(klass); end
  def have_received(method_name); end
  def hide_const(constant_name); end
  def mock(*args); end
  def receive(method_name, &block); end
  def self.included(klass); end
  def stub(*args); end
  def stub_const(constant_name, value, options = nil); end
  include RSpec::Mocks::ArgumentMatchers
end
module RSpec::Mocks::ExampleMethods::ExpectHost
  def expect(target); end
end
class RSpec::Mocks::Proxy
  def add_message_expectation(location, method_name, opts = nil, &block); end
  def add_stub(location, method_name, opts = nil, &implementation); end
  def already_proxied_respond_to; end
  def already_proxied_respond_to?; end
  def as_null_object; end
  def build_expectation(method_name); end
  def check_for_unexpected_arguments(expectation); end
  def find_almost_matching_expectation(method_name, *args); end
  def find_almost_matching_stub(method_name, *args); end
  def find_best_matching_expectation_for(method_name); end
  def find_matching_expectation(method_name, *args); end
  def find_matching_method_stub(method_name, *args); end
  def has_negative_expectation?(message); end
  def initialize(object, name = nil, options = nil); end
  def message_received(message, *args, &block); end
  def method_double; end
  def method_doubles; end
  def null_object?; end
  def object; end
  def raise_missing_default_stub_error(expectation, *args); end
  def raise_unexpected_message_args_error(expectation, *args); end
  def raise_unexpected_message_error(method_name, *args); end
  def received_message?(method_name, *args, &block); end
  def record_message_received(message, *args, &block); end
  def remove_single_stub(method_name, stub); end
  def remove_stub(method_name); end
  def replay_received_message_on(expectation); end
  def reset; end
  def verify; end
end
class RSpec::Mocks::ProxyForNil < RSpec::Mocks::Proxy
  def add_message_expectation(location, method_name, opts = nil, &block); end
  def add_negative_message_expectation(location, method_name, &implementation); end
  def add_stub(location, method_name, opts = nil, &implementation); end
  def initialize; end
  def warn(method_name); end
  def warn_about_expectations; end
  def warn_about_expectations=(arg0); end
  def warn_about_expectations?; end
end
module RSpec::Mocks::TestDouble
  def ==(other); end
  def __build_mock_proxy; end
  def __initialize_as_test_double(name = nil, stubs_and_options = nil); end
  def __mock_proxy; end
  def as_null_object; end
  def assign_stubs(stubs); end
  def extract_option(source, target, key, default = nil); end
  def extract_options(stubs_and_options); end
  def initialize(name = nil, stubs_and_options = nil); end
  def inspect; end
  def method_missing(message, *args, &block); end
  def null_object?; end
  def respond_to?(message, incl_private = nil); end
  def self.extend_onto(object, name = nil, stubs_and_options = nil); end
  def to_s; end
  def to_str; end
end
class RSpec::Mocks::Mock
  include RSpec::Mocks::TestDouble
end
class RSpec::Mocks::ArgumentListMatcher
  def args_match?(*args); end
  def block_passes?(*args); end
  def expected_args; end
  def initialize(*expected_args, &block); end
  def is_matcher?(object); end
  def match_any_args?; end
  def matcher_for(arg); end
  def matchers_match?(*args); end
end
class RSpec::Mocks::MessageExpectation
  def actual_received_count_matters?; end
  def advise(*args); end
  def and_call_original; end
  def and_raise(exception = nil, message = nil); end
  def and_return(*values, &implementation); end
  def and_throw(*args); end
  def and_yield(*args, &block); end
  def any_number_of_times(&block); end
  def argument_list_matcher=(arg0); end
  def at_least(n, &block); end
  def at_most(n, &block); end
  def called_max_times?; end
  def description; end
  def error_generator; end
  def error_generator=(arg0); end
  def exactly(n, &block); end
  def expectation_count_type; end
  def expected_args; end
  def expected_from=(arg0); end
  def expected_messages_received?; end
  def expected_received_count=(arg0); end
  def failed_fast?; end
  def generate_error; end
  def ignoring_args?; end
  def implementation; end
  def implementation=(arg0); end
  def increase_actual_received_count!; end
  def initial_implementation_action=(action); end
  def initialize(error_generator, expectation_ordering, expected_from, method_double, expected_received_count = nil, opts = nil, &implementation_block); end
  def inner_implementation_action=(action); end
  def invoke(parent_stub, *args, &block); end
  def matches?(message, *args); end
  def matches_at_least_count?; end
  def matches_at_most_count?; end
  def matches_exact_count?; end
  def matches_name_but_not_args(message, *args); end
  def message; end
  def negative?; end
  def negative_expectation_for?(message); end
  def never; end
  def once(&block); end
  def ordered(&block); end
  def raise_out_of_order_error; end
  def set_expected_received_count(relativity, n); end
  def similar_messages; end
  def terminal_implementation_action=(action); end
  def times(&block); end
  def twice(&block); end
  def verify_messages_received; end
  def with(*args, &block); end
end
class RSpec::Mocks::AndYieldImplementation
  def arity; end
  def call(*args_to_ignore, &block); end
  def initialize(args_to_yield, eval_context, error_generator); end
end
class RSpec::Mocks::AndReturnImplementation
  def arity; end
  def call(*args_to_ignore, &block); end
  def initialize(values_to_return); end
end
class RSpec::Mocks::Implementation
  def actions; end
  def arg_slice_for(args, arity); end
  def call(*args, &block); end
  def initial_action; end
  def initial_action=(arg0); end
  def inner_action; end
  def inner_action=(arg0); end
  def present?; end
  def terminal_action; end
  def terminal_action=(arg0); end
end
class RSpec::Mocks::AndCallOriginalImplementation
  def arity; end
  def call(*args, &block); end
  def cannot_modify_further_error; end
  def initial_action=(value); end
  def initialize(method); end
  def inner_action=(value); end
  def present?; end
  def terminal_action=(value); end
end
class RSpec::Mocks::AndCallOriginalImplementation::CannotModifyFurtherError < StandardError
end
class RSpec::Mocks::OrderGroup
  def clear; end
  def consume; end
  def empty?; end
  def handle_order_constraint(expectation); end
  def initialize; end
  def ready_for?(expectation); end
  def register(expectation); end
end
class RSpec::Mocks::MockExpectationError < Exception
end
class RSpec::Mocks::AmbiguousReturnError < StandardError
end
class RSpec::Mocks::ErrorGenerator
  def __raise(message); end
  def arg_list(*args); end
  def arg_message(*args); end
  def count_message(count, expectation_count_type = nil); end
  def describe_expectation(message, expected_received_count, actual_received_count, *args); end
  def expected_part_of_expectation_error(expected_received_count, expectation_count_type, argument_list_matcher); end
  def format_args(*args); end
  def format_received_args(*args); end
  def initialize(target, name, options = nil); end
  def intro; end
  def method_call_args_description(args); end
  def opts; end
  def opts=(arg0); end
  def pretty_print(count); end
  def raise_block_failed_error(message, detail); end
  def raise_expectation_error(message, expected_received_count, argument_list_matcher, actual_received_count, expectation_count_type, *args); end
  def raise_expectation_on_mocked_method(method); end
  def raise_expectation_on_unstubbed_method(method); end
  def raise_missing_block_error(args_to_yield); end
  def raise_missing_default_stub_error(expectation, *args); end
  def raise_only_valid_on_a_partial_mock(method); end
  def raise_out_of_order_error(message); end
  def raise_similar_message_args_error(expectation, *args_for_multiple_calls); end
  def raise_unexpected_message_args_error(expectation, *args); end
  def raise_unexpected_message_error(message, *args); end
  def raise_wrong_arity_error(args_to_yield, arity); end
  def received_arg_list(*args); end
  def received_part_of_expectation_error(actual_received_count, *args); end
  def self.raise_double_negation_error(wrapped_expression); end
end
class RSpec::Mocks::Space
  def any_instance_recorder_for(klass); end
  def any_instance_recorders; end
  def ensure_registered(object); end
  def expectation_ordering; end
  def id_for(object); end
  def initialize; end
  def proxies; end
  def proxies_of(klass); end
  def proxy_for(object); end
  def registered?(object); end
  def remove_any_instance_recorder_for(klass); end
  def reset_all; end
  def verify_all; end
end
module Marshal
  def self.dump_with_mocks(object, *rest); end
  def self.dump_without_mocks(*arg0); end
end
module RSpec::Mocks::AnyInstance
end
class RSpec::Mocks::AnyInstance::Chain
  def constrained_to_any_of?(*constraints); end
  def expectation_fulfilled!; end
  def initialize(recorder, *args, &block); end
  def last_message; end
  def messages; end
  def negated?; end
  def never; end
  def playback!(instance); end
  def record(rspec_method_name, *args, &block); end
  include RSpec::Mocks::AnyInstance::Chain::Customizations
end
module RSpec::Mocks::AnyInstance::Chain::Customizations
  def and_call_original(*args, &block); end
  def and_raise(*args, &block); end
  def and_return(*args, &block); end
  def and_throw(*args, &block); end
  def and_yield(*args, &block); end
  def any_number_of_times(*args, &block); end
  def at_least(*args, &block); end
  def at_most(*args, &block); end
  def exactly(*args, &block); end
  def never(*args, &block); end
  def once(*args, &block); end
  def self.record(method_name); end
  def times(*args, &block); end
  def twice(*args, &block); end
  def with(*args, &block); end
end
class RSpec::Mocks::AnyInstance::StubChain < RSpec::Mocks::AnyInstance::Chain
  def create_message_expectation_on(instance); end
  def expectation_fulfilled?; end
  def invocation_order; end
  def verify_invocation_order(rspec_method_name, *args, &block); end
end
class RSpec::Mocks::AnyInstance::StubChainChain < RSpec::Mocks::AnyInstance::StubChain
  def create_message_expectation_on(instance); end
  def invocation_order; end
end
class RSpec::Mocks::AnyInstance::ExpectationChain < RSpec::Mocks::AnyInstance::Chain
  def expectation_fulfilled?; end
  def initialize(*args, &block); end
  def verify_invocation_order(rspec_method_name, *args, &block); end
end
class RSpec::Mocks::AnyInstance::PositiveExpectationChain < RSpec::Mocks::AnyInstance::ExpectationChain
  def create_message_expectation_on(instance); end
  def invocation_order; end
end
class RSpec::Mocks::AnyInstance::MessageChains < Hash
  def add(method_name, chain); end
  def all_expectations_fulfilled?; end
  def has_expectation?(method_name); end
  def initialize; end
  def playback!(instance, method_name); end
  def raise_if_second_instance_to_receive_message(instance); end
  def received_expected_message!(method_name); end
  def remove_stub_chains_for!(method_name); end
  def unfulfilled_expectations; end
end
class RSpec::Mocks::AnyInstance::Recorder
  def already_observing?(method_name); end
  def backup_method!(method_name); end
  def build_alias_method_name(method_name); end
  def initialize(klass); end
  def instance_that_received(method_name); end
  def mark_invoked!(method_name); end
  def message_chains; end
  def normalize_chain(*args); end
  def observe!(method_name); end
  def playback!(instance, method_name); end
  def public_protected_or_private_method_defined?(method_name); end
  def received_expected_message!(method_name); end
  def remove_dummy_method!(method_name); end
  def restore_method!(method_name); end
  def restore_original_method!(method_name); end
  def should_not_receive(method_name, &block); end
  def should_receive(method_name, &block); end
  def stop_all_observation!; end
  def stop_observing!(method_name); end
  def stub!(*arg0); end
  def stub(method_name_or_method_map, &block); end
  def stub_chain(*method_names_and_optional_return_values, &block); end
  def stubs; end
  def unstub!(*arg0); end
  def unstub(method_name); end
  def verify; end
end
module RSpec::Mocks::RecursiveConstMethods
  def const_defined_on?(mod, const_name); end
  def constants_defined_on(mod); end
  def get_const_defined_on(mod, const_name); end
  def normalize_const_name(const_name); end
  def recursive_const_defined?(const_name); end
  def recursive_const_get(const_name); end
end
class RSpec::Mocks::Constant
  def hidden=(arg0); end
  def hidden?; end
  def initialize(name); end
  def inspect; end
  def mutated?; end
  def name; end
  def original_value; end
  def original_value=(arg0); end
  def previously_defined=(arg0); end
  def previously_defined?; end
  def self.original(name); end
  def self.unmutated(name); end
  def stubbed=(arg0); end
  def stubbed?; end
  def to_s; end
  extend RSpec::Mocks::RecursiveConstMethods
end
class RSpec::Mocks::ConstantMutator
  def self.find(name); end
  def self.hide(constant_name); end
  def self.mutate(mutator); end
  def self.mutators; end
  def self.raise_on_invalid_const; end
  def self.register_mutator(mutator); end
  def self.reset_all; end
  def self.stub(constant_name, value, options = nil); end
  extend RSpec::Mocks::RecursiveConstMethods
end
class RSpec::Mocks::ConstantMutator::BaseMutator
  def full_constant_name; end
  def initialize(full_constant_name, mutated_value, transfer_nested_constants); end
  def original_value; end
  def to_constant; end
  include RSpec::Mocks::RecursiveConstMethods
end
class RSpec::Mocks::ConstantMutator::ConstantHider < RSpec::Mocks::ConstantMutator::BaseMutator
  def mutate; end
  def rspec_reset; end
  def to_constant; end
end
class RSpec::Mocks::ConstantMutator::DefinedConstantReplacer < RSpec::Mocks::ConstantMutator::BaseMutator
  def mutate; end
  def rspec_reset; end
  def to_constant; end
  def transfer_nested_constants(constants); end
  def verify_constants_to_transfer!; end
end
class RSpec::Mocks::ConstantMutator::UndefinedConstantSetter < RSpec::Mocks::ConstantMutator::BaseMutator
  def mutate; end
  def rspec_reset; end
  def to_constant; end
end
module RSpec::Mocks::Matchers
end
class RSpec::Mocks::Matchers::HaveReceived
  def apply_constraints_to(expectation); end
  def at_least(*args); end
  def at_most(*args); end
  def count_constraint; end
  def description; end
  def does_not_match?(subject); end
  def ensure_count_unconstrained; end
  def exactly(*args); end
  def expect; end
  def expected_messages_received?; end
  def failure_message; end
  def generate_failure_message; end
  def initialize(method_name); end
  def matches?(subject); end
  def mock_proxy; end
  def negative_failure_message; end
  def once(*args); end
  def times(*args); end
  def twice(*args); end
  def with(*args); end
end
class RSpec::Mocks::Matchers::Receive
  def actual_received_count_matters?(*args, &block); end
  def advise(*args, &block); end
  def and_call_original(*args, &block); end
  def and_raise(*args, &block); end
  def and_return(*args, &block); end
  def and_throw(*args, &block); end
  def and_yield(*args, &block); end
  def any_number_of_times(*args, &block); end
  def argument_list_matcher=(*args, &block); end
  def at_least(*args, &block); end
  def at_most(*args, &block); end
  def called_max_times?(*args, &block); end
  def description(*args, &block); end
  def does_not_match?(subject, &block); end
  def exactly(*args, &block); end
  def expectation_count_type(*args, &block); end
  def expected_args(*args, &block); end
  def expected_messages_received?(*args, &block); end
  def generate_error(*args, &block); end
  def ignoring_args?(*args, &block); end
  def implementation(*args, &block); end
  def increase_actual_received_count!(*args, &block); end
  def initialize(message, block); end
  def invoke(*args, &block); end
  def matches?(subject, &block); end
  def matches_at_least_count?(*args, &block); end
  def matches_at_most_count?(*args, &block); end
  def matches_exact_count?(*args, &block); end
  def matches_name_but_not_args(*args, &block); end
  def message(*args, &block); end
  def negative?(*args, &block); end
  def negative_expectation_for?(*args, &block); end
  def never(*args, &block); end
  def once(*args, &block); end
  def ordered(*args, &block); end
  def raise_out_of_order_error(*args, &block); end
  def setup_allowance(subject, &block); end
  def setup_any_instance_allowance(subject, &block); end
  def setup_any_instance_expectation(subject, &block); end
  def setup_any_instance_method_substitute(subject, method, block); end
  def setup_any_instance_negative_expectation(subject, &block); end
  def setup_expectation(subject, &block); end
  def setup_method_substitute(host, method, block, *args); end
  def setup_mock_proxy_method_substitute(subject, method, block); end
  def setup_negative_expectation(subject, &block); end
  def similar_messages(*args, &block); end
  def times(*args, &block); end
  def twice(*args, &block); end
  def verify_messages_received(*args, &block); end
  def with(*args, &block); end
end
class RSpec::Mocks::Matchers::Receive::Customization
  def initialize(method_name, args, block); end
  def playback_onto(expectation); end
end
class RSpec::Mocks::StubChain
  def block; end
  def chain; end
  def find_matching_stub; end
  def format_chain(*chain, &blk); end
  def initialize(object, *chain, &blk); end
  def object; end
  def self.stub_chain_on(object, *chain, &blk); end
  def stub_chain; end
end
class RSpec::Mocks::UnsupportedMatcherError < StandardError
end
class RSpec::Mocks::NegationUnsupportedError < StandardError
end
class RSpec::Mocks::TargetBase
  def expression; end
  def initialize(target); end
  def self.delegate_to(matcher_method, options = nil); end
  def self.disallow_negation(method); end
end
class RSpec::Mocks::AllowanceTarget < RSpec::Mocks::TargetBase
  def not_to(*args); end
  def to(matcher, &block); end
  def to_not(*args); end
end
class RSpec::Mocks::ExpectationTarget < RSpec::Mocks::TargetBase
  def not_to(matcher, &block); end
  def to(matcher, &block); end
  def to_not(matcher, &block); end
end
class RSpec::Mocks::AnyInstanceAllowanceTarget < RSpec::Mocks::TargetBase
  def not_to(*args); end
  def to(matcher, &block); end
  def to_not(*args); end
end
class RSpec::Mocks::AnyInstanceExpectationTarget < RSpec::Mocks::TargetBase
  def not_to(matcher, &block); end
  def to(matcher, &block); end
  def to_not(matcher, &block); end
end
module RSpec::Mocks::Syntax
  def self.default_should_syntax_host; end
  def self.disable_expect(syntax_host = nil); end
  def self.disable_should(syntax_host = nil); end
  def self.enable_expect(syntax_host = nil); end
  def self.enable_should(syntax_host = nil); end
  def self.expect_enabled?(syntax_host = nil); end
  def self.should_enabled?(syntax_host = nil); end
  def self.stub_object(object, message_or_hash, opts = nil, &block); end
end
class RSpec::Mocks::Configuration
  def add_stub_and_should_receive_to(*modules); end
  def syntax; end
  def syntax=(values); end
end
class BasicObject
  def as_null_object; end
  def null_object?; end
  def received_message?(message, *args, &block); end
  def should_not_receive(message, &block); end
  def should_receive(message, opts = nil, &block); end
  def stub!(message_or_hash, opts = nil, &block); end
  def stub(message_or_hash, opts = nil, &block); end
  def stub_chain(*chain, &blk); end
  def unstub!(message); end
  def unstub(message); end
end
class Class < Module
  def any_instance; end
end
module RSpec::Mocks::Version
end