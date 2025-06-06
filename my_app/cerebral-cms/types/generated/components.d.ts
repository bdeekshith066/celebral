import type { Schema, Struct } from '@strapi/strapi';

export interface SharedIncorrectFlowQuestion extends Struct.ComponentSchema {
  collectionName: 'components_shared_incorrect_flow_questions';
  info: {
    description: '';
    displayName: 'Incorrect Flow Question';
  };
  attributes: {
    category: Schema.Attribute.Enumeration<
      ['Framework', 'Calculations', 'Brainstorming', 'Others']
    >;
    correct_option: Schema.Attribute.Integer;
    flow_order: Schema.Attribute.Integer;
    hint: Schema.Attribute.String;
    options: Schema.Attribute.JSON;
    Title: Schema.Attribute.String;
  };
}

export interface SharedPersonaMessage extends Struct.ComponentSchema {
  collectionName: 'components_shared_persona_messages';
  info: {
    displayName: 'personaMessage';
  };
  attributes: {
    messages: Schema.Attribute.String;
    Trigger: Schema.Attribute.Enumeration<
      [
        'start',
        'slow_answer',
        'fast_answer',
        'three_correct',
        'third_incorrect_flow',
      ]
    >;
  };
}

export interface SharedQuestion extends Struct.ComponentSchema {
  collectionName: 'components_shared_questions';
  info: {
    description: '';
    displayName: 'question';
  };
  attributes: {
    category: Schema.Attribute.Enumeration<
      ['Framework', 'Calculations', 'Brainstorming', 'Others']
    >;
    correct_option: Schema.Attribute.Integer;
    hint: Schema.Attribute.String;
    incorrect_flows: Schema.Attribute.Component<
      'shared.incorrect-flow-question',
      true
    >;
    is_rabbit_entry_point: Schema.Attribute.Boolean;
    max_attempts: Schema.Attribute.Integer;
    options: Schema.Attribute.JSON;
    return_to_main_flow_on_completion: Schema.Attribute.Boolean;
    text: Schema.Attribute.String;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'shared.incorrect-flow-question': SharedIncorrectFlowQuestion;
      'shared.persona-message': SharedPersonaMessage;
      'shared.question': SharedQuestion;
    }
  }
}
