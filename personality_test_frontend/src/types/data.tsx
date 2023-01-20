export interface IQuestion {
  id: number;
  content: string;
}
export interface ISignin {
  logged_in: boolean;
  user_id: number;
}

export interface IAnswer {
  id: number;
  content: string;
  score: number;
}

export interface IQuestionAndAnswers {
  question: IQuestion;
  answers: IAnswer[];
}