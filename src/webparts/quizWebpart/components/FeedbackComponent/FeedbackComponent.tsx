import * as React from 'react';
import { FeedbackComponentProps } from './FeedbackComponentProps';

const FeedbackComponent = ({ results , onSubmit, onError}: FeedbackComponentProps) => {
  return (
    <div>
      <h2>Quiz Results</h2>
      <p>Name: {results.name}</p>
      <p>Country: {results.country}</p>
      {/* Display additional results and feedback */}
    </div>
  );
};

export default FeedbackComponent;
